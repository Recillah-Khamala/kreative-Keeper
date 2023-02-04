require 'rails_helper'

describe 'Posts', type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:post) { FactoryBot.create(:post, author: user) }

  before(:each) do
    post.save
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get "/users/#{user.id}/posts"
      expect(response).to be_successful
    end

    it 'returns http success' do
      get "/users/#{user.id}/posts"
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get "/users/#{user.id}/posts"
      expect(response).to render_template(:index)
    end

    it 'assigns the correct post count' do
      get "/users/#{user.id}/posts"
      expect(assigns(:posts).count).to be > 0
    end

    it 'assigns the correct post count' do
      get "/users/#{user.id}/posts"
      expect(assigns(:posts).count).to eq(Post.where(author_id: user.id).count)
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response).to render_template(:show)
    end
  end
end
