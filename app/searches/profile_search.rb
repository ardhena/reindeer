class ProfileSearch < Searchlight::Search
  search_on User.all

  searches :first_name, :last_name, :sex, :country, :school, :city, :friends, :tags, :interests, :languages

  def search_country
    search.where(country: country)
  end

  def search_school
    search.where(school: school)
  end

  def search_city
    search.where('city ILIKE ?', "%#{city}%")
  end

  def search_sex
    search.where(sex: sex)
  end

  def search_first_name
    search.where('first_name ILIKE ?', "%#{first_name}%")
  end

  def search_last_name
    search.where('last_name ILIKE ?', "%#{last_name}%")
  end

  def search_tags
    interest_tag = ActsAsTaggableOn::Tag.find_by(name: tags[0])
    language_tag = ActsAsTaggableOn::Tag.find_by(name: tags[1])
    if interest_tag && language_tag
      search.joins(:taggings).where( taggings: { context: 'interests', tag_id: interest_tag.id } ) || search.joins(:taggings).where( taggings: { context: 'languages', tag_id: language_tag.id } )
    elsif interest_tag
      search.joins(:taggings).where( taggings: { context: 'interests', tag_id: interest_tag.id } )
    elsif language_tag
      search.joins(:taggings).where( taggings: { context: 'languages', tag_id: language_tag.id } )
    else
      search.all
    end
  end
end