class User < ActiveRecord::Base
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
		number = User.find(19).phone_number
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
end
