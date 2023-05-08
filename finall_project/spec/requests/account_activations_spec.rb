require 'rails_helper'

RSpec.describe 'AccountActivations', type: :request do
  let(:user) { create(:user, activated: false) }
  let(:activation_token) { user.activation_token }
  let(:mail) { user.email }

  context 'when activation link is valid' do
    before do
      allow(user).to receive(:authenticated?).and_return(true)
      get edit_account_activation_path(activation_token, email: mail), params: { email: mail, id: activation_token }
    end

    it 'activates the user' do
      expect(flash[:success]).to eq('Account activated!')
    end

    it 'redirects to root_url' do
      expect(response).to redirect_to(root_url)
    end
  end

  context 'with invalid activation link' do
    before do
      allow(user).to receive(:authenticated?).and_return(false)
      get edit_account_activation_path('invalid_token', email: mail), params: { email: mail, id: 'invalid_token' }
    end

    it 'sets the flash danger message' do
      expect(flash[:danger]).to eq('Invalid activation link')
    end
  end
end
