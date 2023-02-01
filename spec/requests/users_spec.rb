require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    before { get users_url }

    it 'returns a successful response' do
      expect(response).to be_successful
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'returns a response with http status' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #show' do
    before { get '/users/4' }

    it 'returns a successful response' do   
      expect(response).to be_successful
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end

    it 'finds the correct user' do
      expect(response.body).to include('Users#show')
    end
  end
end
