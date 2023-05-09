FactoryBot.define do
  factory :user do
    full_name { Faker::Name.name }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
    phoneNumber { Faker::Number.leading_zero_number(digits: 11) }
    image { nil }
    activated { true }
  end

  factory :category do
    category_name { Faker::Name.name }
  end

  factory :thanks_card do
    title { 'Example title' }
    content { 'Example content' }
    description { 'Example description' }
    category
    user
  end

  factory :users_receiver do
    association :user
    association :thanks_card
  end

  factory :comment do
    comment_content { 'Test comment' }
    association :user
    association :thanks_card
  end
end
