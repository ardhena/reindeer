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

  def interests_collection
    (
      ["acting", "basketball", "computers", "cooking", "cycling", "dancing", "drawing", "electronics", "football", "foreign languages", "gaming", "gardening", "geocaching", "jogging", "movies", "music", "paintball", "photography", "reading", "singing", "sports", "video gaming", "writing"] + self.interests
    ).uniq.sort_by { |interest| interest.downcase }
  end

  def interests
    array = []
    object.taggings.where(context: 'interests').each do |tagging|
      array += [tagging.tag.name]
    end
    array
  end

  def new_interests
  end
end