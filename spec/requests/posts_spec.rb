require 'rails_helper'

describe 'Posts', type: :request do

  describe 'GET #index' do
    before { get '/users/3/posts' }

    it 'returns a success response' do
      expect(response).to be_successful
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'assigns the correct post count' do
      expect(assigns(:post).count).to be > 1
    end
  end

  describe 'GET #show' do
    before { get '/users/3/posts/2' }

    it 'returns a success response' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end
  end
end
