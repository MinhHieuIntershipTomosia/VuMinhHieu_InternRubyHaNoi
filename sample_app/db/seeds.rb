# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create a main sample user.
User.create!(name: "Vũ Minh Hiếu",
             email: "vuluy3000@gmail.com",
             password: "123456",
             password_confirmation: "123456",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)
# Generate a bunch of additional users.
99.times do |n|
  name = Faker::Name.name
  email = "example-#{n + 1}@railstutorial.org"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end
# Tạo các micropost cho một phần của người dùng.
# micropost là một bài đăng ngắn trên mạng
users = User.order(:created_at).take(6) # lay ra 6 nguoi dau tien sap xep theo ngay tao
50.times do
content = Faker::Lorem.sentence(word_count: 5)
title = Faker::Name.name
users.each { |user| user.microposts.create!(content: content, title: title) }
end