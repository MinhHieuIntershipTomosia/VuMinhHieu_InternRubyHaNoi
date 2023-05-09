# frozen_string_literal: true

require 'rails_helper'

# test home
RSpec.describe 'Mypages', type: :request do
  describe 'GET #home' do
    it 'returns http success' do
      get root_path
      expect(response).to have_http_status(:success)
    end

    it 'renders the home template' do
      get root_path
      expect(response).to render_template('my_page/home')
    end

    it 'assigns @thanks_card' do
      thanks_card1 = create(:thanks_card)
      thanks_card2 = create(:thanks_card)
      get root_path
      expect(assigns(:thanks_card)).to match_array([thanks_card1, thanks_card2])
    end
  end
end

# test send_thanks_card
RSpec.describe 'Mypages', type: :request do
  describe 'GET #send_thanks_card' do
    let(:users) { create(:user) }
    let(:user1) { create(:user) }
    let(:user2) { create(:user) }

    let(:thanks_card1) { create(:thanks_card, user: users) }
    let(:thanks_card2) { create(:thanks_card, user: users) }

    let(:user_receiver1) { create(user: user1, thanks_card: thanks_card1) }
    let(:user_receiver2) { create(user: user2, thanks_card: thanks_card2) }

    before do
      post login_path, params: { session: { email: users.email, password: users.password } }
    end

    it 'returns http success' do
      get send_path
      expect(response).to have_http_status(:success)
    end

    it 'renders the home template' do
      get send_path
      expect(response).to render_template('my_page/send_thanks_card')
    end
  end
end

# test send_new_thanks_card
RSpec.describe 'Mypages', type: :request do
  describe 'GET #send_new_thanks_card' do
    let(:users) { create(:user) }
    before do
      post login_path, params: { session: { email: users.email, password: users.password } }
    end

    it 'assigns @users' do
      user1 = create(:user)
      user2 = create(:user)
      get sendnew_path
      expect(assigns(:users)).to match_array([user1, user2])
    end

    it 'renders the send new template' do
      get sendnew_path
      expect(response).to render_template('my_page/send_new_thanks_card')
    end
  end
end

# test receiver
RSpec.describe 'Mypages', type: :request do
  describe 'GET #receiver' do
    let(:users) { create(:user) }
    before do
      post login_path, params: { session: { email: users.email, password: users.password } }
    end

    it 'returns http success' do
      get receiver_path
      expect(response).to have_http_status(:success)
    end

    it 'renders the receiver template' do
      get receiver_path
      expect(response).to render_template('my_page/receiver')
    end
  end
end

# test get all thankscard delete
RSpec.describe 'Mypages', type: :request do
  describe 'GET #getall_tkcard_delete' do
    let(:users) { create(:user) }
    before do
      post login_path, params: { session: { email: users.email, password: users.password } }
    end

    it 'returns http success' do
      get thankscardelete_path
      expect(response).to have_http_status(:success)
    end

    it 'renders the get all thankscard delete template' do
      get thankscardelete_path
      expect(response).to render_template(partial: 'thanks_card/_list_thanks_card')
    end
  end
end

# test get all thankscard receiver delete
RSpec.describe 'Mypages', type: :request do
  describe 'GET #getall_tkcard_delete' do
    let(:users) { create(:user) }
    before do
      post login_path, params: { session: { email: users.email, password: users.password } }
    end

    it 'returns http success' do
      get receiverdelete_path
      expect(response).to have_http_status(:success)
    end

    it 'renders the get all thankscard delete template' do
      get receiverdelete_path
      expect(response).to render_template(partial: 'thanks_card/_list_thanks_card_receiver')
    end
  end
end

# test report
RSpec.describe 'Mypages', type: :request do
  describe 'GET #report' do
    let(:users) { create(:user) }
    before do
      post login_path, params: { session: { email: users.email, password: users.password } }
    end

    it 'returns http success' do
      get report_path
      expect(response).to have_http_status(:success)
    end

    it 'renders the report template' do
      get report_path
      expect(response).to render_template('my_page/report')
    end
  end
end
