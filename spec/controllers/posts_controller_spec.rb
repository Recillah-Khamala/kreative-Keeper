require 'rails_helper'

RSpec.describe PostsController, type: :controller do
#   let(:user) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', postscounter: 3) }
#   let(:post) do
#     Post.create(author: user.id, title: 'Hello', text: 'This is my first post', likescounter: 9, commentscounter: 5)
#   end
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

  describe "GET #show" do 
    let(:comment) { FactoryBot.create(:comment, post_id: post.id, author: user) }
    let(:like) { FactoryBot.create(:like, post_id: post.id) }

    before do 
      post
      comment
      like
    end

    it "returns http success" do
      get :show, params: { user_id: user.id, id: post.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the show template" do
      get :show, params: { user_id: user.id, id: post.id }
      expect(response).to render_template(:show)
    end
  end
end
