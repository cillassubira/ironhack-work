class Concert < ActiveRecord::Base
	validates :artist, :venue, :city, :date, :price, :description, presence: true
	has_many :comments
end
