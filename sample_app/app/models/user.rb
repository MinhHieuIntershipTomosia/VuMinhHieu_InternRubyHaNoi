class User < ApplicationRecord
  has_many :microposts, dependent: :destroy
  attr_accessor :remember_token, :activation_token, :reset_token
  before_save :downcase_email
  before_create :create_activation_digest
  #begin test callback
  after_validation { puts 2 }
  before_validation { puts 1 }
  before_save { puts 3 }
  # around_save { puts 4 }
  after_create { puts 7 }
  before_create { puts 5 }
  # around_create { puts 6 }
  after_save { puts 8 }
  # after_commit { puts 9 }
  # after_rollback { puts 10 }
  before_destroy { puts 9 }
  # around_destroy { puts 10}
  after_destroy { puts 11 }
  # end test callback
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
      BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end

  # Kich hoat tai khoan.
  def activate
    update_columns(activated: true, activated_at: Time.zone.now)
  end

  # gui tin nhan kich hoat mail.
  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  # Dat lai thuoc tinh mat khau
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest, User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  #Gui email dat lai mat khau
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  #Trả về true nếu đặt lại mật khẩu đã hết hạn.
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  private

  # Converts email to all lower-case.
  def downcase_email
    self.email = email.downcase
  end

  # Creates and assigns the activation token and digest.
  def create_activation_digest
    self.activation_token = User.new_token
    self.activation_digest = User.digest(activation_token)
  end
end
