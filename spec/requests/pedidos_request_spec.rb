require 'rails_helper'

describe 'Costumer consult Pedidos' do
    it "returns a pedido" do
      restaurante = create(:restaurante)
      item = create(:item)
      pedido = Pedido.create({ restaurante_id: restaurante.id, item_id: item.id, status_pedido: 0})
      
      get '/api/v1/pedidos'
      
      expect(response).to have_http_status(:success)
      json_response = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(json_response["data"].length).to_not eq 0
    end
    
    it " and returns an specific" do
      restaurante = create(:restaurante)
      item = create(:item)
      pedido = Pedido.create({ restaurante_id: restaurante.id, item_id: item.id, status_pedido: 0})
      
      get "/api/v1/pedidos/#{pedido.id}"

      expect(response.content_type).to eq('application/json')
      expect(response).to have_http_status(:success)
      json_response = JSON.parse(response.body)
      expect(json_response["data"].length).to_not eq 0
      expect(json_response["data"]["id"]).to eq pedido.id
    end
end

describe 'Costumer modify a Pedido' do
    it "successfuly" do
      restaurante = create(:restaurante)
      item = create(:item)
      pedido = Pedido.create({ restaurante_id: restaurante.id, item_id: item.id, status_pedido: 0})
      
      put "/api/v1/pedidos/#{pedido.id}", params: {}
      expect(response.content_type).to eq('application/json')
      expect(response).to have_http_status(:success)
      json_response = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(json_response["data"].length).to_not eq 0
      expect(json_response["data"]["id"]).to eq pedido.id
    end

    it "with error" do 
        pending("A implementação que utilizei aplicando 'update_attributes' não retorna erros. Tenho que substituir")
        fail
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
        pending("Ainda não implementei um fallback para essa ação.")
        fail
    end
end