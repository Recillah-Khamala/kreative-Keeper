require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let(:user) do
    User.create(
      name: 'Recillah',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'A Ruby on Rails enthusiast',
      postscounter: 0
    )
  end
  let(:post) do
    Post.create(
      title: 'my title',
      text: 'all about Ruby',
      commentscounter: 0,
      likescounter: 0,
      author_id: user.id
    )
  end

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
