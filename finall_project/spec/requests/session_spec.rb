require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  # test create session
  describe '#create' do
    let(:user) do
      create(:user,
             full_name: 'Vu Minh Hieu',
             email: 'test@example.com',
             phoneNumber: '1234567890',
             password: 'password',
             activated: true)
    end

    context 'when user provides valid credentials' do
      before do
        post login_path, params: { session: { email: 'test@example.com', password: 'password' } }
      end

      it 'check http code' do
        expect(response).to have_http_status(:success)
      end
    end
  end

  # test logout
  describe 'DELETE #destroy' do
    context 'when user is logged in' do
      before do
        # login user here
        delete logout_path
      end

      it 'redirects to the root page' do
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when user is not logged in' do
      before do
        delete logout_path
      end

      it 'redirects to the root page' do
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
