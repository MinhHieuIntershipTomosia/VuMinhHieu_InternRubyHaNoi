# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create!(full_name: "Vũ Minh Hiếu",
             email: "vuluy3000@gmail.com",
             phoneNumber: "0868259241",
             password: "123456",
             password_confirmation: "123456",
             activated: true,
             activated_at: Time.zone.now)
User.create!(full_name: "Ngô Minh Hiếu",
             email: "ngohieu2000@gmail.com",
             phoneNumber: "0868259261",
             password: "123456",
             password_confirmation: "123456",
             activated: true,
             activated_at: Time.zone.now)
User.create!(full_name: "Vũ Tuấn Hoàng",
             email: "vuhoang3000@gmail.com",
             phoneNumber: "0868259271",
             password: "123456",
             password_confirmation: "123456",
             activated: true,
             activated_at: Time.zone.now)


3.times do
  content = Faker::Lorem.sentence(word_count: 5)
  Category.create!(category_name: content)
end

users = User.find(1)
users2 = User.find(2)


10.times do
  content = Faker::Lorem.sentence(word_count: 5)
  title = Faker::Name.name
  cate_id = rand(1..3)
  description = "With this change, creating a new book for a particular author is easier:With this change, creating a new book for a particular author is easier:"
  thankscard = users.thanks_card.create!(content: content, title: title, description: description, category_id: cate_id)
  thankscard.users_receiver.create!(user_id: rand(2..3))
end

15.times do
  content = Faker::Lorem.sentence(word_count: 5)
  title = Faker::Name.name
  cate_id = rand(1..3)
  description = "With this change, creating a new book for a particular author is easier:With this change, creating a new book for a particular author is easier:"
  thankscard = users2.thanks_card.create!(content: content, title: title, description: description, category_id: cate_id)
  thankscard.users_receiver.create!(user_id: [1, 3].sample)
end

10.times do
  content = Faker::Lorem.sentence(word_count: 5)
  comment = users2.comments.create!(comment_content: content, thanks_card_id: rand(1..25))
end

10.times do
  content = Faker::Lorem.sentence(word_count: 5)
  comment = users.comments.create!(comment_content: content, thanks_card_id: rand(1..25))
end