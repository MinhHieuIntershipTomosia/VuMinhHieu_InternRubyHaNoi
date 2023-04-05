class User < ApplicationRecord
    has_many :thanks_cards
    has_many :comments
end
