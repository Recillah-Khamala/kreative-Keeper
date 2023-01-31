require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to be_successful
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end

    it 'returns a response with http status'do 
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #show" do
    before :each do
      user.save
    end

    let(:user) { User.create(id: 1, name: 'Recillah', photo: 'today_rails.png', bio: 'Example of my bio', postscounter: 7) }

    it "returns a successful response" do
      get :show, params: { id: user.id }
      expect(response).to be_successful
    end

    it "renders the show template" do
      get :show, params: { id: user.to_param }
      expect(response).to render_template(:show)
    end

    it 'finds the correct user' do
      get :show, params: { id: user.id }
      expect(assigns(:post)).to eq(user)
    end
  end
end