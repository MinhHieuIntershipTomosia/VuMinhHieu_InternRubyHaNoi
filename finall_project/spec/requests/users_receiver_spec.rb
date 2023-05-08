# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersReceiverController, type: :controller do
  describe 'GET #show' do
    let(:users_receiver) { create(:users_receiver) }

    it 'returns a success response' do
      get :show, params: { id: users_receiver.id }
      expect(response).to be_successful
    end

    it 'assigns the correct users_receiver' do
      get :show, params: { id: users_receiver.id }
      expect(assigns(:users_receiver)).to eq(users_receiver)
    end

    it 'renders the show template' do
      get :show, params: { id: users_receiver.id }
      expect(response).to render_template('show')
    end
  end
end

RSpec.describe UsersReceiverController, type: :controller do
  describe 'DELETE #destroy' do
    let(:users_receiver) { create(:users_receiver) }

    it 'sets the users_receivers_delete attribute to true' do
      delete :destroy, params: { id: users_receiver.id }
      users_receiver.reload
      expect(users_receiver.users_receivers_delete).to be_truthy
    end
  end
end
