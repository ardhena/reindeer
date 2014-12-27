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
    User.countries.map do |type, _|
      [I18n.t(type, scope: :countries)]
    end
  end

  def schools_collection
    User.schools.map do |type, _|
      [I18n.t(type, scope: :schools)]
    end
  end

  def sexes_collection
    User.sexes.map do |type, _|
      [I18n.t(type, scope: :sexes)]
    end
  end
end