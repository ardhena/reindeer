class MessageDecorator < Draper::Decorator
  delegate_all
  decorates_association :user

  def date
    created_at.in_time_zone.strftime("%m-%d-%y %H:%M")
  end
end