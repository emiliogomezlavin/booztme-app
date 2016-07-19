class Phone < ActiveRecord::Base

	include Messenger

	def clean_number
		number = self.number.scan(/\d+/).join
		number[0] == "1" ? number[0] = "" : number
		number unless number.lenght != 10
	end

	def send_sms(number)
		acct_sid = 'AC061425bcf72ca98521059df2b7868122'
		auth_token = '4cbd0c66e0252049ec94d172d5a0a209'

		@client = Twilio::REST::Client.new acct_sid, auth_token

		from = '+12567433652'

		message = @client.account.messages.create(
			:from => from,
			:to => number,
			:body => "Boozt for Jen who has done an amazing job today. Remeber we're just learning!! Enjoy the doggy!!",
			:media_url => 'https://media.giphy.com/media/13RmTVMmTM08tW/giphy.gif'
			)
	end
end
