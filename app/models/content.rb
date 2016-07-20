class Content < ActiveRecord::Base
	has_many :users, through: :boozts
end
