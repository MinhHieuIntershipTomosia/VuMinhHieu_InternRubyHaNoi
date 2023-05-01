require 'rails_helper'

RSpec.describe User, type: :model do
  # Test validation
  describe 'validations' do
    it 'is valid with a full_name, email, phoneNumber, and password' do
      user = User.new(
        full_name: 'John Smith',
        email: 'john@example.com',
        phoneNumber: '1234567890',
        password: 'password'
      )
      expect(user).to be_valid
    end
  end

  it 'is valid with a password of at least 6 characters' do
    user = User.new(password: '123456')
    user.valid?
    expect(user.errors).not_to have_key(:password)
  end

  # Test association
  describe 'associations' do
    it 'should have many thankscard' do
      t = User.reflect_on_association(:thanks_card)
      expect(t.macro).to eq(:has_many)
    end

    it 'should have many comment' do
      t = User.reflect_on_association(:comments)
      expect(t.macro).to eq(:has_many)
    end

    it 'should have many users_receiver' do
      t = User.reflect_on_association(:users_receiver)
      expect(t.macro).to eq(:has_many)
    end
  end

  # Test callbacks
  describe 'before_save callback' do
    it 'converts email to lowercase' do
      user = User.new(
        full_name: 'John Smith',
        email: 'JOHN@EXAMPLE.COM',
        phoneNumber: '1234567890',
        password: 'password',
      )
      user.save
      expect(user.email).not_to match(/[A-Z]/)
    end
  end

  describe 'before_create callback' do
    it 'generates an activation token' do
      user = User.new(
        full_name: 'John Smith',
        email: 'JOHN@EXAMPLE.COM',
        phoneNumber: '1234567890',
        password: 'password'
      )
      user.save
      expect(user.activation_token).not_to be_nil
      expect(user.activation_remember_token).not_to be_nil
    end
  end

  # Test has_secure_password
  describe 'with has_secure_password' do
    it 'sets the password_digest attribute' do
      user = User.new(
        full_name: 'John Smith',
        email: 'test@example.com',
        phoneNumber: '1234567890',
        password: 'password'
      )
      expect(user.password_digest).not_to eq(user.password)
    end

    it 'authenticates a user with a valid password' do
      user = User.new(
        full_name: 'John Smith',
        email: 'test@example.com',
        phoneNumber: '1234567890',
        password: 'password'
      )
      expect(user.authenticate('password')).to eq(user)
    end
  end

  # Test uniqueness
  describe 'validations' do
    it 'validates uniqueness of email and phone' do
      User.create(
        full_name: 'John Smith',
        email: 'test@example.com',
        phoneNumber: '1234567890',
        password: 'password'
      )
      user2 = User.new(
        full_name: 'John Smith',
        email: 'test@example.com',
        phoneNumber: '1234567890',
        password: 'password'
      )
      expect(user2.save).to be_falsey
      expect(user2.errors[:email]).to include('has already been taken')
      expect(user2.errors[:phoneNumber]).to include('has already been taken')
    end
  end

  # Test function activate user
  describe 'activate' do
    let(:user) do
      User.create(
        full_name: 'John Smith',
        email: 'test@example.com',
        phoneNumber: '1234567890',
        password: 'password'
      )
    end
    it 'activates the user' do
      expect(user.activated).to eq(false)
      expect(user.activated_at).to be_nil

      user.activate
      user.reload

      expect(user.activated).to eq(true)
      expect(user.activated_at).not_to be_nil
    end
  end
end
