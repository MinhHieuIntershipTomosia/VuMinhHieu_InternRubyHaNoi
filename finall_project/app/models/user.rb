class User < ApplicationRecord
  has_many :thanks_cards
  has_many :comments
  validates :full_name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  validates :phoneNumber, presence: true, length: { maximum: 11 }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  before_save :downcase_email
  # variable
  attr_accessor :remember_token

  # create new tooken
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # ma hoa 1 chuoi
  def User.encode_bycrypt(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # remember token
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_token_user, User.encode_bycrypt(remember_token))
  end

  private

  def downcase_email
    self.email = email.downcase
  end
end
