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
    let(:users) { FactoryBot.create(:user) }

    before do
      post login_path, params: { session: { email: users.email, password: users.password } }
    end

    it 'returns http success' do
      get send_path
      expect(response).to have_http_status(:success)
    end

    context 'when status is false' do
      it 'returns only deleted ThanksCard' do
        deleted_thanks_card = FactoryBot.create(:thanks_card, user: users, delete_status: false)
        FactoryBot.create(:users_receiver, user: users, thanks_card: deleted_thanks_card)

        get send_path
        expect(assigns(:thankscard)).to match_array([deleted_thanks_card])
      end
    end

    context 'when status is true' do
      it 'returns only non-deleted ThanksCard' do
        FactoryBot.create(:thanks_card, user: users, delete_status: true)
        FactoryBot.create(:users_receiver, user: users)

        get send_path
        expect(assigns(:thankscard)).to match_array([])
      end
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

    it 'assigns @thankscard with a new ThanksCard instance' do
      get sendnew_path
      expect(assigns(:thankscard)).to be_a_new(ThanksCard)
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
    let(:sender) { create(:user) }
    let(:receiver1) { create(:user) }
    let(:receiver2) { create(:user) }
    let(:receiver3) { create(:user) }

    before do
      create_list(:thanks_card, 10, user: sender, users_receiver: [create(:users_receiver, user: receiver1)])
      create_list(:thanks_card, 5, user: sender, users_receiver: [create(:users_receiver, user: receiver2)])
      create_list(:thanks_card, 3, user: sender, users_receiver: [create(:users_receiver, user: receiver3)])
      post login_path, params: { session: { email: sender.email, password: sender.password } }
      get report_path
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'assigns top one sender' do
      expect(assigns(:user_send)).to match_array([User.first])
    end

    it 'renders the report template' do
      expect(response).to render_template('my_page/report')
    end
  end
end
