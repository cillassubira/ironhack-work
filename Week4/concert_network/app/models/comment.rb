class Comment < ActiveRecord::Base
	#validates :commentator, :comment
	belongs_to :concert
end
