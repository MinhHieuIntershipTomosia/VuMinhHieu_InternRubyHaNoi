class ThanksCard < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :users_receiver
  validates :user, presence: true
  validates :content, presence: true, length: { maximum: 150 }
  validates :title, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 150 }

  after_create :create_user_reciver

  def create_user_reciver()
    receivers_params = params[:thanks_card][:user].split(",")
    receivers = receivers_params.map { |receiver_id| User.find(receiver_id) }

    self.users_receiver.build(receivers.map { |receiver| { user: receiver } })
    self.attributes = params[:thanks_card]

    self.save
  end
end
