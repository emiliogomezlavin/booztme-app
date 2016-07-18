class User < ActiveRecord::Base
	validates :first_name, :last_name, :email, :password, presence: true
	validates :email, uniqueness: true
	validates :password, confirmation:true

	has_secure_password
  	def self.confirm(params)
    	@user = User.find_by({email: params[:email]})
    	@user.try(:authenticate, params[:password])
  	end

  	boozt_email
	def self.boozt_email()
		@content = Content.find(4)
		@user = User.find(111)
    	UserBoozt.boozt_email(@user, @content).deliver
	end
end
