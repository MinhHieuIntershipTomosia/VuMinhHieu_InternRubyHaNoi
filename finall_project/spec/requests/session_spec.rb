require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  # test create session success
  describe '#create' do
    let(:user) { create(:user) }

    context 'when user provides valid credentials' do
      it 'check http code' do
        post login_path, params: { session: { email: user.email, password: user.password, remember_me: '1' } }
        expect(response).to redirect_to(root_path)
      end

      it 'allows logging in and remembering the user' do
        post login_path, params: { session: { email: user.email, password: user.password, remember_me: '1' } }
        expect(response).to redirect_to(root_path)
        expect(cookies[:remember_token]).not_to be_nil
        get root_path
        expect(response.body).to include(user.full_name)
      end

      it 'logs in user and does not remember them' do
        post login_path, params: { session: { email: user.email, password: user.password, remember_me: '0' } }
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(root_path)
        expect(cookies[:remember_token]).to be_nil
      end
    end
  end
end

RSpec.describe 'Sessions', type: :request do
  # test create session fail
  describe '#create' do
    let(:user) { create(:user) }

    context 'when the user provides invalid credentials' do
      before do
        post login_path, params: { session: { email: user.email, password: 'wrong_password' } }
      end

      it 'does not log in the user' do
        expect(session[:user_id].nil?).to be true
      end

      it 'displays an error message' do
        expect(response.body).to include('email or password incorrect')
      end
    end
  end
end

RSpec.describe 'Sessions', type: :request do
  # test user not active
  describe '#create' do
    it 'redirects to root url and shows warning message' do
      user = FactoryBot.create(:user, activated: false)
      post login_path, params: { session: { email: user.email, password: user.password } }
      expect(response).to redirect_to root_url
      expect(flash[:warning]).to be_present
    end
  end
end

RSpec.describe 'Sessions#create', type: :request do
  before do
    @user = create(:user)
  end

  it 'does not log in the user' do
    post login_path, params: { session: { email: @user.email, password: 'wrong_password' } }
    expect(response).to render_template('new')
    expect(flash.now[:danger]).to be_present
    expect(session[:user_id].nil?).to be true
  end
end

RSpec.describe 'Sessions', type: :request do
  describe '#create' do
    it 'does not log in the user when no email is provided' do
      post login_path, params: { session: { email: '', password: 'password' } }
      expect(response).to render_template(:new)
      expect(flash[:danger]).to eq('email or password incorrect')
      expect(session[:user_id].nil?).to be true
    end

    it 'does not log in the user when no password is provided' do
      post login_path, params: { session: { email: 'user@example.com', password: '' } }
      expect(response).to render_template(:new)
      expect(flash[:danger]).to eq('email or password incorrect')
      expect(session[:user_id].nil?).to be true
    end

    it 'does not log in the user when no email or password is provided' do
      post login_path, params: { session: { email: '', password: '' } }
      expect(response).to render_template(:new)
      expect(flash[:danger]).to eq('email or password incorrect')
      expect(session[:user_id].nil?).to be true
    end
  end
end

# test display
RSpec.describe 'Sessions', type: :request do
  describe 'GET /login' do
    let(:user) { create(:user) }

    it 'displays the login page' do
      get login_path
      expect(response).to have_http_status(:success)
      expect(response.body).to include('Log in')
    end
  end
end

RSpec.describe 'Sessions#destroy', type: :request do
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
