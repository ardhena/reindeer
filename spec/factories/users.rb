FactoryGirl.define do
  factory :user do
    email 'user@example.com'
    password '12345678'
    first_name 'Joe'
    last_name 'MacMillan'
  end
end