FactoryGirl.define do
  factory :admin do
    email 'admin@example.com'
    password '12345678'
    first_name 'Joe'
    last_name 'MacMillan'
    country 'Norway'
  end
end