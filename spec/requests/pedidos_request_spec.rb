require 'rails_helper'

describe 'Costumer consult Pedidos' do
    before do
      get '/api/v1/pedidos'
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
end