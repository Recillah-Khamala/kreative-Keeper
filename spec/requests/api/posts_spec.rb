require 'swagger_helper'

RSpec.describe 'api/posts', type: :request do
  describe 'GET /api/v1/users/:user_id/posts/' do
    it 'returns status code 200' do
      user = 2
      get api_v1_user_posts_path(user)
      expect(response).to have_http_status(200)
    end
  end
end
