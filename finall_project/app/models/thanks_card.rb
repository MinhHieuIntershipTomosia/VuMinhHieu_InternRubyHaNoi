# frozen_string_literal: true

# Model representing a Thanks Card in the application.
class ThanksCard < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments
  has_many :users_receiver
  has_many :likes
  has_many_attached :image
  validates :user, presence: true
  validates :content, presence: true, length: { maximum: 150 }
  validates :title, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 150 }
  after_update :update_satus_delete

  def update_satus_delete
    return if delete_status

    @lst_user = users_receiver
    @lst_user.each do |users_receiver|
      users_receiver.update(delete_status: true, users_receivers_delete: true)
    end
  end

  def create_user_receiver(lst_user_id)
    return if lst_user_id.blank?

    lst_user = lst_user_id.split(',')
    lst_user.each do |user_id|
      user = User.find(user_id)
      users_receiver = self.users_receiver.build
      users_receiver.user = user
      users_receiver.save
    end
  end
end
