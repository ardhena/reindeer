class UserDecorator < Draper::Decorator
	delegate :first_name, :last_name, :email, :country, :birth

	def name
		"#{first_name} #{last_name}"
	end
end