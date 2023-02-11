require 'swagger_helper'

RSpec.describe 'api/comments', type: :request do

  describe 'GET /api/v1/users/:user_id/posts/:post_id/comments' do
    it 'returns status code 200' do
      user = 2
      post = 4
      get api_v1_user_post_comments_path(user, post)
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /api/v1/users/:user_id/posts/:post_id/comments' do
    it 'checks if post has been added' do
      valid_attributes = {
        post_id: 4,
        user_id: 2,
        author_id: 1,
        text: 'i like this'
      }
      post api_v1_user_post_comments_path(valid_attributes)
      expect(response).to have_http_status(200)
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['text']).to eq('This is me')
    end
  end
end
