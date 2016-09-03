class Content < ActiveRecord::Base
	has_many :boozts, dependent: :destroy
	has_many :users, through: :boozts

	## giphy
	def self.get_GIPHY_data (category)
		category_data = category.split("+")
		response = HTTParty.get('http://api.giphy.com/v1/gifs/search?q=' + category + '&api_key=dc6zaTOxFJmzC&fmt=json')
		response["data"].each do |content|
			url = content["images"]["fixed_height"]["url"]
			Content.create({
				title: category_data[0] + " " + category_data[1],
	            url: url,
	            category: "GIF",
	            sentiment: category_data[0]
				})
		end
	end
end
