require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user) do
    User.create(
      name: 'Recillah',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'A Ruby on Rails enthusiast',
      postscounter: 0
    )
  end

  describe 'GET #index' do
    before { get user_path(user) }

    it 'returns a successful response' do
      expect(response).to be_successful
    end

    it 'returns a response with http status' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #show' do
    before { get user_path(user) }

    it 'returns a successful response' do
      expect(response).to be_successful
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end

    it 'finds the correct user' do
      expect(response.body).to include('title')
    end
  end
end
