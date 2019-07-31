require 'rails_helper'

describe 'Create an user' do
    user = nil
    before do
      user = build(:user)
      post "/api/v1/users/create", 
      params: { user: 
                    { email: user.email, password: user.password, username: user.username }
              }
      json_response = JSON.parse(response.body)
      expect(json_response["jwt"]).to_not eq ""
      token = json_response["jwt"]
    end
    
    it "with success" do
      expect(response).to have_http_status(:success)
    end

    it " and user exists" do
      expect(User.exists?(email: user.email)).to eq true
    end
end