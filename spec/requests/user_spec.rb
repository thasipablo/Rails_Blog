require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'GET /index' do
    before :each do
      get '/users'
    end

    it 'returns success status' do
      expect(response).to have_http_status(:success)
    end

    it 'renders index view' do
      expect(response).to render_template(:index)
    end

    it 'include the correct placeholder text' do
      expect(response.body).to include('Users#index')
    end
  end
end
