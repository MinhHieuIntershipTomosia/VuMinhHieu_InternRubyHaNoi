# frozen_string_literal: true

# Model representing comment for Thanks Cards
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :thanks_card
end
