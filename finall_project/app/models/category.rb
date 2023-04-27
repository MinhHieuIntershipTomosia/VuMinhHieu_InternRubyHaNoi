# frozen_string_literal: true

# Model representing a category for Thanks Cards
class Category < ApplicationRecord
  has_many :thanks_card
end
