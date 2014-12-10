class ArticleDecorator < Draper::Decorator
	delegate :title, :content
	decorates_association :articles_comments

	def date
		object.created_at.to_formatted_s(:db)
	end

	def author
		object.admin.first_name + ' ' + object.admin.last_name
	end
end 