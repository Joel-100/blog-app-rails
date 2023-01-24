require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /users/:id/posts' do
    before(:example) { get '/users/12/posts' }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the :index template' do
      expect(response).to render_template(:index)
    end

    it 'display header in the body response' do
      expect(response.body).to include('Here is a list of posts for a given user')
    end
  end

  describe 'GET /users/:id/posts/:id' do
    before(:example) { get '/users/12/posts/24' }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the :show template' do
      expect(response).to render_template(:show)
    end

    it 'display header in the body response' do
      expect(response.body).to include('Here is a single post from list of posts for a given user')
    end
  end
end
