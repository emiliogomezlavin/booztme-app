class HomeController < ApplicationController

	def home
		session.delete(:user_id)
		render :home
	end


end
