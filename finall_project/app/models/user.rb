class User < ApplicationRecord
  has_many :thanks_card
  has_many :comments
  before_create :create_activation_token
  before_save :downcase_email

  validates :full_name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  validates :phoneNumber, presence: true, length: { maximum: 11 }, uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  # remember
  # token user, token active user
  attr_accessor :remember_token, :activation_token

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
    update_attribute(:user_remember_token, User.encode_bycrypt(remember_token))
  end

  # Kich hoat tai khoan.
  def activate
    update_columns(activated: true, activated_at: Time.zone.now)
  end

  # retun true if remember_token same with user_remember_token colum in database
  def authenticated?(attribute, token)
    digest = send("#{attribute}_remember_token")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  # user forget
  def forget
    update_attribute(:user_remember_token, nil)
  end

  # gui tin nhan kich hoat mail.
  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  private

  def downcase_email
    self.email = email.downcase
  end

  #create token active user

  def create_activation_token
    self.activation_token = User.new_token
    self.activation_remember_token = User.encode_bycrypt(activation_token)
  end
end
