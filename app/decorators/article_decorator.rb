class ArticleDecorator < Draper::Decorator
	delegate :title
	decorates_association :comments
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

	def comments
		"#{object.comments.count} " + 'comment'.pluralize(object.comments.count)
	end
end