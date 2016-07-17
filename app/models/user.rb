class User < ActiveRecord::Base

	def self.prueba()
		User.create({
          first_name: "Santi",
          last_name: "Me",
          email: "ayudo@worker.com",
          password_digest: "yeiii"
          })
	end
end
