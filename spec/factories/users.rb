FactoryGirl.define do
  factory :user do
    email 'user@example.com'
    password '12345678'
    first_name 'Joe'
    last_name 'MacMillan'
    sex 'female'
    country 'norway'
    school 'norwegian_school'
    city 'Oslo'
    birth '1994-03-23'
  end
end