require 'rails_helper'

RSpec.describe "Api::V1::TestController", type: :request do
  let(:user) { create(:user) }

  before do
    # Faz o login do usuário e obtém o token JWT
    post '/login', params: { user: { email: user.email, password: user.password } }
    @jwt_token = response.headers['Authorization'].split(' ').last
  end

  describe "GET /test" do
    it "returns a successful response" do
      get '/api/v1/test', headers: { Authorization: "Bearer #{@jwt_token}" }

      expect(response).to have_http_status(:success)
      expect(response.body).to include('Teste')
    end

    it "returns unauthorized if no token is provided" do
      get '/api/v1/test'

      expect(response).to have_http_status(:unauthorized)
    end
  end
end
