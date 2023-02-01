require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:post) { FactoryBot.create(:post) }

  describe 'GET #index' do
    it 'returns a success response' do
      get :index, params: { user_id: user }
      expect(response).to be_successful
    end

    it 'returns http success' do
      get :index, params: { user_id: user.id }
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get :index, params: { user_id: user.id }
      expect(response).to render_template(:index)
    end

    it 'assigns the correct post count' do
      get :index, params: { user_id: user.id }
      expect(assigns(:posts).count).to be > 1
    end
  end

  describe 'GET #show' do
    before { get :show, params: { user_id: user.id, id: post.id } }

    it 'returns a success response' do
      expect(response).to be_successful
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end
  end
end
