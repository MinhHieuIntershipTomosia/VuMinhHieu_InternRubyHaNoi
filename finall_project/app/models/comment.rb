class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :thanks_cards
end
