# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Admin.create(email: 'admin@norway.test', password: '12345678')
User.create(email: 'user@norway.test', password: '12345678')

5.times do |i|
  New.create(title: "News #{i}", content: 'Lorem ipsum doloret sit ament', admin_id: Admin.find_by(email: 'admin@norway.test').id)
end

6.times do |i|
  Article.create(title: "Article #{i}", content: 'Lorem ipsum doloret sit ament', admin_id: Admin.find_by(email: 'admin@norway.test').id)
end