require 'rails_helper'

RSpec.describe 'Comments', type: :request do
  describe 'GET /new' do
    it 'returns http success' do
      get '/comments/new'
      expect(response).to render_template(:new)
    end
  end

  describe 'GET /create' do
    it 'returns http success' do
      post '/comments', params: { comment: { text: 'This is a comment' } }
      expect(response).to have_http_status(:redirect)
    end
  end
end
