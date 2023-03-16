class User < ApplicationRecord
  before_save { self.email = email.downcase }
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
  around_destroy { puts 10 }
  after_destroy { puts 11 }
  # validates :name, :presence =>{ allow_blank: false, message: "  không được để trống" }, length: {minimum: 6 , maximum: 50 , message: 'độ dài của tên phải lớn hơn 6 kí tự'} 
  validates :name, presence: true, length: { minimum: 6 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
