require 'rails_helper'

# test create
RSpec.describe 'Comments', type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:category) { FactoryBot.create(:category) }
  let(:thanks_card) { FactoryBot.create(:thanks_card, category: category) }
  let(:comment_params) { { message: 'Test comment', thankscard_id: thanks_card.id } }

  before do
    post login_path, params: { session: { email: user.email, password: user.password } }
  end

  describe '#create' do
    context 'with valid params' do
      it 'creates a new comment and renders the comment partial' do
        expect do
          post comment_index_path, params: { comment: comment_params }
        end.to change { Comment.count }.by(1)

        expect(response).to render_template(partial: '_comment')
        expect(response.body).to include(comment_params[:message])
      end
    end
  end
end

RSpec.describe 'Comments', type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:thanks_card) { FactoryBot.create(:thanks_card, user: user) }
  let(:comment) { FactoryBot.create(:comment, user: user, thanks_card: thanks_card) }

  before do
    post login_path, params: { session: { email: user.email, password: user.password } }
  end

  describe 'DELETE #destroy' do
    it 'deletes the comment' do
      expect do
        delete comment_path(comment), params: { id: comment.id }
      end.to change(Comment, :count).by(-1)
    end
  end
end
