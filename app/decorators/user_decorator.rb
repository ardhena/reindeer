class UserDecorator < Draper::Decorator
	delegate :first_name, :last_name, :email, :country, :birth
end