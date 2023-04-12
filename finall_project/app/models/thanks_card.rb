class ThanksCard < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments
  has_many :users_receiver
  validates :user, presence: true
  validates :content, presence: true, length: { maximum: 150 }
  validates :title, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 150 }

  def create_user_receiver(lst_user_id)
    if !lst_user_id.nil?
      lst_user = lst_user_id.split(",")
      lst_user.each do |user_id|
        user = User.find(user_id)
        users_receiver = self.users_receiver.build;
        users_receiver.user = user
        users_receiver.save
      end
    end
  end
end
