# frozen_string_literal: true

# Model representing a Thanks Card in the application.
class UsersReceiver < ApplicationRecord
  belongs_to :thanks_card
  belongs_to :user
end
