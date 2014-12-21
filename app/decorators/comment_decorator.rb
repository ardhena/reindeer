class CommentDecorator < Draper::Decorator
  delegate_all
  decorates_association :user

  def date
    object.created_at.to_formatted_s(:db)
  end

  def author
    "#{user.first_name} #{user.last_name}"
  end

  def comment
    object.comment
  end
end