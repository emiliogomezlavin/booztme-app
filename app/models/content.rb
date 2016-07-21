class Content < ActiveRecord::Base
	has_many :boozts, dependent: :destroy
	has_many :users, through: :boozts

	## giphy
	def self.get_GIPHY_data
		response = HTTParty.get('http://api.giphy.com/v1/gifs/search?q=funny+panda&api_key=dc6zaTOxFJmzC&fmt=json')
		response["data"].each do |content|
			url = content["images"]["fixed_height"]["url"]
			Content.create({
				title: "Funny Panda",
	            url: url,
	            category: "GIF",
	            sentiment: "Panda"
				})
		end
	end
end
