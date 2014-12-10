class ArticlesComment < ActiveRecord::Base

	belongs_to :user
	belongs_to :article

end