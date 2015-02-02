class NewDecorator < Draper::Decorator
	delegate :title, :content
	decorates_association :comments
  decorates_association :admin

	def date
		object.created_at.in_time_zone.strftime("%m-%d-%y %H:%M")
	end

	def author
		"#{admin.first_name} #{admin.last_name}"
	end

  def comments
    "#{object.comments.count} " + 'comment'.pluralize(object.comments.count)
  end
end