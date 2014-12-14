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
  2.times do |j|
    NewsComment.create(content: "Comment #{j} for News #{i}", user_id: User.find_by(email: 'user@norway.test'), new_id: New.find_by(title: "News #{i}"))
  end
end

6.times do |i|
  Article.create(title: "Article #{i}", content: 'Lorem ipsum doloret sit ament', admin_id: Admin.find_by(email: 'admin@norway.test').id)
  3.times do |j|
    ArticlesComment.create(content: "Comment #{j} for Article #{i}", user_id: User.find_by(email: 'user@norway.test').id, article_id: Article.find_by(title: "Article #{i}").id)
  end
end