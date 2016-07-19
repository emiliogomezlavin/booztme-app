module Messenger
	def send_sms(number)
		acct_sid = 'AC061425bcf72ca98521059df2b7868122'
		auth_token = '4cbd0c66e0252049ec94d172d5a0a209'

		@client = Twilio::REST::Client.new acct_sid, auth_token

		from = '+12567433652'

		message = @client.account.messages.create(
			:from => from,
			:to => '+1'+number,
			:body => "Work hard. Do good",
			:media_url => 'http://www.acuteaday.com/blog/wp-content/uploads/2013/04/adorable-baby-elephant-spraying-water-out-of-trunk.jpg'
			)
	end
end