class Micropost < ApplicationRecord
  belongs_to :user
  # default_scope -> {order(id: :desc)}
  default_scope -> {order(updated_at: :desc)}
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validates :title, presence: true, length: { maximum: 20 }
end
