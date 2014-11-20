class NewDecorator < Draper::Decorator
	delegate :title, :content

	def date
		object.created_at.to_formatted_s(:db)
	end

	def author
		object.admin.first_name + ' ' + object.admin.last_name
	end
end