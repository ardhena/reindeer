class NewsComment < ActiveRecord::Base

	belongs_to :user
	belongs_to :new

end