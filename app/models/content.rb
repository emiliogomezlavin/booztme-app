class Content < ActiveRecord::Base
	has_many :boozts, dependent: :destroy
	has_many :users, through: :boozts
end
