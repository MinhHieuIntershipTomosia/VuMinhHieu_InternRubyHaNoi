# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersReceiver, type: :model do
  # Test association
  describe 'associations' do
    it 'should have a thanks_card' do
      t = UsersReceiver.reflect_on_association(:thanks_card)
      expect(t.macro).to eq(:belongs_to)
    end

    it 'should have a user' do
      t = UsersReceiver.reflect_on_association(:user)
      expect(t.macro).to eq(:belongs_to)
    end
  end
end
