class ProfileSearch < Searchlight::Search
  search_on User.all

  searches :first_name, :last_name, :sex, :country, :school, :city, :friends

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
end