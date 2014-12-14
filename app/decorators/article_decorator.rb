class ArticleDecorator < Draper::Decorator
	delegate :title
	decorates_association :articles_comments
	decorates_association :admin

	def date
		object.created_at.to_formatted_s(:db)
	end

	def author
		"#{admin.first_name} #{admin.last_name}"
	end

	def content
		object.content.html_safe
	end
end