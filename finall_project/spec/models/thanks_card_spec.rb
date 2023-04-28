require 'rails_helper'

RSpec.describe ThanksCard, type: :model do
  # Test association
  describe 'associations' do
    it 'should have many users_receiver' do
      t = ThanksCard.reflect_on_association(:users_receiver)
      expect(t.macro).to eq(:has_many)
    end

    it 'should have many comments' do
      t = ThanksCard.reflect_on_association(:comments)
      expect(t.macro).to eq(:has_many)
    end

    it 'should have one user' do
      t = ThanksCard.reflect_on_association(:user)
      expect(t.macro).to eq(:belongs_to)
    end

    it 'should have a category' do
      t = ThanksCard.reflect_on_association(:category)
      expect(t.macro).to eq(:belongs_to)
    end

    it 'should have many image' do
      thanks_card = ThanksCard.create
      expect(thanks_card.image).to be_an_instance_of(ActiveStorage::Attached::Many)
    end
  end

  # Test validation
  describe 'validation' do
    it 'is valid when content, title, description is not empty' do
      users = User.create(
        full_name: 'John Smith',
        email: 'test@example.com',
        phoneNumber: '1234567890',
        password: 'password'
      )
      categorys = Category.create(category_name: 'Test Category')
      thanks_card = ThanksCard.create(
        content: 'This is a valid content',
        title: 'Test',
        description: 'Test',
        user: users,
        category: categorys
      )
      expect(thanks_card).to be_valid
    end
  end
end
