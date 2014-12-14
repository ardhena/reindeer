class NewDecorator < Draper::Decorator
	delegate :title, :content
	decorates_association :news_comments
  decorates_association :admin

	def date
		object.created_at.to_formatted_s(:db)
	end

	def author
		"#{admin.first_name} #{admin.last_name}"
	end
end