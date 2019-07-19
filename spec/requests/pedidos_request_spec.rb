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
    end
end

describe 'Costumer get a Pedido' do

    it "returns a pedido" do
      restaurante = create(:restaurante)
      item = create(:item)
      pedido = Pedido.create({ restaurante_id: restaurante.id, item_id: item.id, status_pedido: 0})
      
      get "/api/v1/pedidos/#{pedido.id}"
      json_response = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(json_response["data"].length).to_not eq 0
      expect(json_response["data"]["id"]).to eq pedido.id
    end
end

describe 'Costumer modify a Pedido' do
    it "with success" do
      restaurante = create(:restaurante)
      item = create(:item)
      pedido = Pedido.create({ restaurante_id: restaurante.id, item_id: item.id, status_pedido: 0})
      
      put "/api/v1/pedidos/#{pedido.id}", params: {
        
      }
      json_response = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(json_response["data"].length).to_not eq 0
      expect(json_response["data"]["id"]).to eq pedido.id
    end

    it "with error" do 
      skip
    end
end

describe 'Customer delete an restaurante' do
    it "with success" do
      restaurante = create(:restaurante)
      item = create(:item)
      pedido = Pedido.create({ restaurante_id: restaurante.id, item_id: item.id, status_pedido: 0})
        
      delete "/api/v1/pedidos/#{pedido.id}"
      expect(response).to have_http_status(:success)
    end

    it "with error" do
    skip
    end
end