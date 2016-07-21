class User < ActiveRecord::Base
	has_many :boozts, dependent: :destroy
	has_many :contents, through: :boozts

	validates :first_name, :last_name, :email, :password, presence: true
	# validates :email, uniqueness: true
	validates :password, confirmation:true

	has_secure_password
  	def self.confirm(params)
    	@user = User.find_by({email: params[:email]})
    	@user.try(:authenticate, params[:password])
  	end

  	
	def self.boozt_email(boozt)
		@content = Content.find(boozt.content_id)
		@user = User.find(boozt.user_id)
    	UserBoozt.boozt_email(@user, @content).deliver
	end

	def self.boozt_sms(boozt)

		@content = Content.find(boozt.content_id)
		@user = User.find(boozt.user_id)
		number = @user.phone_number
		content = @content.url

		account_sid = 'AC061425bcf72ca98521059df2b7868122'
		auth_token = '4cbd0c66e0252049ec94d172d5a0a209'

		@client = Twilio::REST::Client.new account_sid, auth_token

		from = '+12567433652'
		
		message = @client.account.messages.create(
			:from => from,
			:to => number,
			:body => "Hi #{@user.first_name} here is your boozt!!",
			:media_url => content
			)
	end


	## Set Random Times daily for each user
	def self.setRandomTime ()
		users = User.all
		contents = Content.all
		random_boozt_time = []

		## get's today's date
		today = User.getToday
		## iterates throught each user to set it's random_boozt_time
		users.each do |user|
			j=0
			## sets the random_boozts for each user based on how many boozts need to be set
			while j < user.boozts_per_frequency do
				time = Time.new(today[0],today[1],today[2],user.boozt_start,0,0, "-07:00")
				random = Random.new.rand(0.0...1.0)
				dif = ((user.boozt_end - user.boozt_start)*60*60)
				add_on = (random * dif).to_i
				random_boozt_time[j] = time + add_on
				j += 1
			end

			random_boozt_time.each do |boozt|
				##  sets a random index for the content array to use on the user
				##  *** Missing to check if user already got that content
				random = Random.new.rand(0.0...1.0)
				cont_index = (random * contents.length).to_i

				## create instance in boozt table
				new_boozt = Boozt.new({user: user, content: contents[cont_index], timestamp: boozt})
				new_boozt.save
			end
		end
	end
		
	def self.getToday
		today_array = Time.now.to_a
		return [today_array[5], today_array[4], today_array[3]]
	end

	
	def self.send_boozts ()
		boozts = Boozt.all
		now = Time.now
		nowTen = now + 600

		## iterates through all boozts
		boozts.each do |boozt|
			p boozt.timestamp
			p now
			if boozt.timestamp > now && boozt.timestamp < nowTen
				##calls on message, text or email
				p "it goes in"
				User.boozt_sms(boozt)
				User.boozt_email(boozt)
			end
		end
	end


end
