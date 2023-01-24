require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    before(:example) { get '/users' }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the :index template' do
      expect(response).to render_template(:index)
    end

    it 'display header in the body response' do
      expect(response.body).to include('Here is a list of users')
    end
  end

  describe 'GET /users/:id' do
    before(:example) { get '/users/12' }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the :show template' do
      expect(response).to render_template(:show)
    end

    it 'display header in the body response' do
      expect(response.body).to include('Here is a user informations for a given user')
    end
  end
end
