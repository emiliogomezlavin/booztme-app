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
		random_num = Random.new
		users = User.all
		contents = Content.all

		## get's today's date
		today = User.getToday()
		## iterates throught each user to set it's random_boozt_time
		users.each do |user|
			j=0
			## sets the random_boozts for each user based on how many boozts need to be set
			while j < user.boozts_per_frequency do
				user.random_boozt_time[j] = Time.new(today[0],today[1],today[2],user.boozt_start,0,0, "-07:00") + (random_num.rand(0.0...1.0) * ((user.boozt_end - user.boozt_start)*60*60)).to_i
				j += 1
			end
			user.random_boozt_time.sort!

			user.random_boozt_time.each do |boozt|
				##  sets a random index for the content array to use on the user
				##  *** Missing to check if user already got that content
				random_num_cont = Random.new
				cont_index = ((random_num_cont.rand(0.0...1.0)) * contents.length).to_i

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
		i = 0
		now = Time.now
		nowTen = now + 600

		## iterates through all boozts
		boozts.each do |boozt|
			if boozt.timestamp > now && boozt.timestamp < nowTen
				##calls on message, text or email
				User.boozt_sms(boozt)
				User.boozt_email(boozt)
			end
		end


		while i < users.length do
			j=0
			## iterates through all random times per user and breaks
			##  if the random_time isn't in the next ten minutes. 
			##  If random_time applies then it calls on the send
			##  message or email definition
			while j < users[i].random_boozt_time.length do
				# checks if the random_time is in the next ten minutes 
				if users[i].random_boozt_time[j] > now && users[i].random_boozt_time[j] < nowTen 
					##calls on message, text or email
					j += 1
				else
					break		
				end
			end
			i += 1
		end
		
	end


end
