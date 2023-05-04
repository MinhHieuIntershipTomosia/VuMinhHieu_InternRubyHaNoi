# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  # Test association
  describe 'associations' do
    it 'should have a thanks_card' do
      t = Category.reflect_on_association(:thanks_card)
      expect(t.macro).to eq(:has_many)
    end
  end
end
