class User < ActiveRecord::Base
	validates :first_name, :last_name, :email, :password, presence: true
	validates :email, uniqueness: true
	validates :password, confirmation:true

	has_secure_password
  	def self.confirm(params)
    	@user = User.find_by({email: params[:email]})
    	@user.try(:authenticate, params[:password])
  	end


	def self.prueba()
		User.create({
          first_name: "Santi",
          last_name: "Me",
          email: "ayudo@worker.com",
          password: "12345",
          password_confirmation: "12345"
          })
	end
end
