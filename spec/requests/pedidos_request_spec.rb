require 'rails_helper'

describe 'Costumer consult Pedidos' do
    before do
      get '/api/v1/pedidos'
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "returns a pedido" do
      restaurante = create(:restaurante)
      item = create(:item)
      pedido = Pedido.create({ restaurante_id: restaurante.id, item_id: item.id, status_pedido: 0})
      
      get '/api/v1/pedidos'
      json_response = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(json_response["data"].length).to_not eq 0
      byebug
    end
end