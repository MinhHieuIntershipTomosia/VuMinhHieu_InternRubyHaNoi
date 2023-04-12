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
user = User.find(1)

3.times do
    content = Faker::Lorem.sentence(word_count: 5)
    Category.create!(category_name: content)
end

users = User.find(1)

10.times do
  content = Faker::Lorem.sentence(word_count: 5)
  title = Faker::Name.name
  cate_id = rand(1..3)
  description = "With this change, creating a new book for a particular author is easier:With this change, creating a new book for a particular author is easier:" 
  users.thanks_card.create!(content: content, title: title, description: description, categories_id:  cate_id) 
end
