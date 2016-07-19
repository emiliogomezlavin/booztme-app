class TextyController < ApplicationController

	include Messenger

	def new_text
		@user = current_user
		render :index
	end

	def send_text
		@user = current_user
		@user.send_sms(@user.phone_number)
		redirect_to :back
	end

	private
	def phone_params
		params.require(:phone).permit(:number)
	end
end
