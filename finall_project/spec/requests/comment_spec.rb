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

# edit comment
RSpec.describe CommentController, type: :controller do
  let!(:comment) { FactoryBot.create(:comment) }
  let(:new_message) { 'New comment message' }
  before do
    put :update, params: { id: comment.id, comment: { message: new_message } }
  end
  describe 'PUT #update' do
    it 'updates the comment message' do
      comment.reload
      expect(comment.comment_content).to eq(new_message)
    end
  end
end

# destroy comment
RSpec.describe 'Comments', type: :request do
  let(:users) { FactoryBot.create(:user) }
  let(:thankscard) { FactoryBot.create(:thanks_card, user: users) }
  before do
    post login_path, params: { session: { email: users.email, password: users.password } }
  end

  describe 'DELETE #destroy' do
    let!(:comment) { FactoryBot.create(:comment, user: users, thanks_card: thankscard) }
    it 'deletes the comment' do
      expect do
        delete comment_path(comment), params: { id: comment.id }
      end.to change(Comment, :count).by(-1)
    end
  end
end
