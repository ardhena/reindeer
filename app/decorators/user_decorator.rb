class UserDecorator < Draper::Decorator
	delegate_all

	def name
		"#{first_name} #{last_name}"
	end

  def birthday
    birth.strftime("%d %B")
  end

  def age
    "#{object.age} " + 'year'.pluralize(object.age)
  end

  def countries_collection
    User.countries.map do |name, value|
      [I18n.t(name, scope: :countries), name]
    end
  end

  def schools_collection
    User.schools.map do |name, value|
      [I18n.t(name, scope: :schools), name]
    end
  end

  def sexes_collection
    User.sexes.map do |name, value|
      [I18n.t(name, scope: :sexes), name]
    end
  end
end