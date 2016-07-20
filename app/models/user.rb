class User < ActiveRecord::Base

	has_many :contents, through: :boozts

	validates :first_name, :last_name, :email, :password, presence: true
	validates :email, uniqueness: true
	validates :password, confirmation:true

	has_secure_password
  	def self.confirm(params)
    	@user = User.find_by({email: params[:email]})
    	@user.try(:authenticate, params[:password])
  	end

  	
	def self.boozt_email()
		@content = Content.find(4)
		@user = User.find(111)
    	UserBoozt.boozt_email(@user, @content).deliver
	end

	def send_sms()
		number = User.find(111).phone_number
		account_sid = 'AC061425bcf72ca98521059df2b7868122'
		auth_token = '4cbd0c66e0252049ec94d172d5a0a209'

		@client = Twilio::REST::Client.new account_sid, auth_token

		from = '+12567433652'

		message = @client.account.messages.create(
			:from => from,
			:to => number,
			:body => "It also works with my worker!!!"
			# :media_url => 'https://media.giphy.com/media/13RmTVMmTM08tW/giphy.gif'
			)
	end


	## Get randomicity
	def setRandomTime (user)
		random_num = Random.new
		i = 0
		today = getToday()
		while i < user.boozts_per_frequency do
			user.random_boozt_time[i] = Time.new(today[0],today[1],today[2],user.boozt_start,0,0, "-07:00") + (random_num.rand(0.0...1.0) * ((user.boozt_end - user.boozt_start)*60*60)).to_i
			i += 1
		end
		user.random_boozt_time.sort!
		return user
	end
		
	def getToday
		today_array = Time.now.to_a
		return [today_array[5], today_array[4], today_array[3]]
	end

	## Not ready yet
	def send_boozts ()
		users = []
		users = User.all
		i = 0
		now = Time.now
		nowTen = now + 600
		while i < users.length do
			j=0
			while j < users[i].random_boozt_time.lenght do
				if users[i].random_boozt_time[j] > now  
					if users[i].random_boozt_time[j] < nowTen 
						##calls on message or email
					else
						break
				else 
					break
				j += 1
			end
			
		end
		
	end


end
