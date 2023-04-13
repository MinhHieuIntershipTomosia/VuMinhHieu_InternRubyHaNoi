class UsersReceiver < ApplicationRecord
    belongs_to :thanks_card
    belongs_to :user
end
