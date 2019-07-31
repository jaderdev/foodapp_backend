require 'rails_helper'

describe 'User sign in' do
    user = nil
    token = nil
    before do
      user = build(:user)
      post "/api/v1/users/create", 
      params: { user: 
                { email: user.email, password: user.password, username: user.username }
              }
    end
    
    it "with success" do
      expect(response).to have_http_status(:success)
    end

    it " and get token" do
      post "/api/v1/user_token",params: { auth: { email: user.email, password: user.password } }
      expect(response).to have_http_status(:success)
      json_response = JSON.parse(response.body)
      expect(json_response["jwt"]).to_not eq ""
      token = json_response["jwt"]
    end

    it " and token is valid" do
      get "/api/v1/auth",params: { auth: { email: user.email, password: user.password } }, headers: { 'HTTP_AUTHORIZATION'=>token }
      expect(response).to have_http_status(:success)
    end

    it " and token is invalid" do
      @request.env['Authentication'] = token
      get "/api/v1/auth",params: { auth: { email: user.email, password: user.password } }, headers: { 'HTTP_AUTHORIZATION'=>"asdasdasdasdasd" }
      expect(response).to_not have_http_status(:success)
    end
end