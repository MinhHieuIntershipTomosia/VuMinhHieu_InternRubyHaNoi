# frozen_string_literal: true

require 'rails_helper'

# test create
RSpec.describe 'ThanksCards', type: :request do
  describe '#create' do
    let(:category) { FactoryBot.create(:category) }
    let(:user) { FactoryBot.create(:user) }
    let(:thanks_card) do
      {
        thanks_card: {
          title: 'Test ThanksCard',
          content: 'Test content',
          description: 'Test description',
          category: category.id,
          user_receiver_id: user.id
        }
      }
    end
    context 'with valid params' do
      before do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        post thanks_card_index_path, params: thanks_card
      end
      it 'creates a new thanks card' do
        expect(ThanksCard.count).to eq(1)
      end
    end
  end
end

RSpec.describe 'ThanksCards', type: :request do
  describe '#create' do
    let(:category) { FactoryBot.create(:category) }
    let(:user) { FactoryBot.create(:user) }
    let(:thanks_card) do
      {
        thanks_card: {
          title: 'Test content',
          content: 'Test content',
          description: 'Test description',
          category: '',
          user_receiver_id: nil
        }
      }
    end
    context 'with valid params' do
      before do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        post thanks_card_index_path, params: thanks_card
      end
      it 'renders the send_new_thanks_card template' do
        expect(response).to redirect_to(sendnew_path)
      end
    end
  end
end

RSpec.describe 'ThanksCards', type: :request do
  describe '#create' do
    let(:category) { FactoryBot.create(:category) }
    let(:user) { FactoryBot.create(:user) }
    let(:thanks_card) do
      {
        thanks_card: {
          title: '',
          content: '',
          description: '',
          category: category.id,
          user_receiver_id: user.id
        }
      }
    end
    context 'with valid params' do
      before do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        post thanks_card_index_path, params: thanks_card
      end
      it 'renders the send_new_thanks_card template' do
        expect(response.body).to include('errors')
        expect(response).to render_template('my_page/send_new_thanks_card')
      end
    end
  end
end

# test show

RSpec.describe 'ThanksCards', type: :request do
  describe '#show' do
    let(:thanks_card) { FactoryBot.create(:thanks_card) }
    before { get thanks_card_path(thanks_card), params: { id: thanks_card.id } }
    it 'renders the show template' do
      expect(response).to render_template('thanks_card/show')
    end

    it 'assigns the requested thanks card to @thankscard' do
      expect(assigns(:thankscard)).to eq(thanks_card)
    end

    it 'assigns the correct sidebar value' do
      expect(assigns(:siderbar)).to eq('send')
    end
  end
end

# test edit
RSpec.describe 'ThanksCards', type: :request do
  describe '#edit' do
    let(:category) { FactoryBot.create(:category) }
    let(:user) { FactoryBot.create(:user) }
    let(:thankscard) { FactoryBot.create(:thanks_card, user: user) }
    let(:updated_thankscard_params) do
      {
        id: thankscard.id,
        thanks_card: {
          title: 'Updated Title',
          content: 'Updated Content',
          description: 'Updated Description',
          category: category.id,
          user_receiver_id: user.id
        }
      }
    end
    before do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      put thanks_card_path(thankscard), params: updated_thankscard_params
    end
    it 'redirects to the send page' do
      expect(response).to redirect_to(send_url)
    end
    it 'sets a success flash message' do
      expect(flash[:success]).to eq('ThanksCard update success')
    end
  end
end

# test edit error
RSpec.describe 'ThanksCards', type: :request do
  describe '#edit' do
    let(:category) { FactoryBot.create(:category) }
    let(:user) { FactoryBot.create(:user) }
    let(:thankscard) { FactoryBot.create(:thanks_card, user: user) }
    let(:updated_thankscard_params) do
      {
        id: thankscard.id,
        thanks_card: {
          title: 'Updated Title',
          content: 'Updated Content',
          description: 'Updated Description',
          category: category.id,
          user_receiver_id: user.id
        }
      }
    end
    before do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      allow_any_instance_of(ThanksCard).to receive(:update).and_return(false)
      put thanks_card_path(thankscard), params: updated_thankscard_params
    end
    it 'sets an error flash message' do
      expect(flash[:danger]).to eq('thanksCard update Error')
    end
  end
end

# test destroy
RSpec.describe 'ThanksCards', type: :request do
  describe '#destroy' do
    let(:user) { FactoryBot.create(:user) }
    let(:thanks_card) { FactoryBot.create(:thanks_card, user: user) }
    before do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      delete thanks_card_path(thanks_card.id), params: { id: thanks_card.id }
    end

    it 'deletes the thankscard' do
      thanks_card.reload
      expect(thanks_card.delete_status).to be true
    end

    it 'redirects to send page' do
      expect(response).to redirect_to(send_url)
    end
  end
end
