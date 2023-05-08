# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User registration page', type: :request do
  # check render template
  it 'renders the singup template' do
    get signup_path
    expect(response).to render_template('user/new')
  end

  # check http code
  it 'reuturn http success' do
    get signup_path
    expect(response).to have_http_status(:success)
  end
end

RSpec.describe 'Users', type: :request do
  describe 'POST #create' do
    context 'when signup success' do
      let(:user_data) do
        {
          user: {
            full_name: 'John Doe',
            email: 'johndoe@example.com',
            password: 'password',
            password_confirmation: 'password',
            phoneNumber: '0123456789',
          }
        }
      end
      before(:example) do
        post user_index_path, params: user_data
      end

      it 'redirects to root_url' do
        expect(response).to redirect_to root_url
      end

      it 'displays a flash message' do
        expect(flash[:info]).to eq('Please check your email to activate your account.')
      end
    end
  end
end

# test create user
RSpec.describe 'User registration page', type: :request do
  # test valid true
  context 'check valid user data true' do
    let(:user_data) do
      {
        user: {
          full_name: 'John Doe',
          email: 'johndoe@example.com',
          password: 'password',
          password_confirmation: 'password',
          phoneNumber: '0123456789'
        }
      }
    end

    it 'creates a new user' do
      expect { post user_index_path, params: user_data }.to change(User, :count).by(1)
    end

    it 'sends a confirmation email' do
      expect do
        post user_index_path, params: user_data
      end.to change(ActionMailer::Base.deliveries, :count).by(1)
    end
  end

  # test valid false
  context 'when invalid data is provided' do
    let(:user_test) do
      {
        user: {
          full_name: 'John Doe',
          email: 'invalid_email',
          password: 'password',
          password_confirmation: 'different_password',
          phoneNumber: '0123456789'
        }
      }
    end
    it 'does not save the user to the database' do
      expect { User.create(user_test[:user]) }.not_to change(User, :count)
    end
    it 'has errors' do
      user = User.new(user_test[:user])
      user.valid?
      expect(user.errors).not_to be_empty
    end
  end
end
