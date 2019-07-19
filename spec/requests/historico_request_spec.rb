require 'rails_helper'

describe 'Costumer consult historicos from a pedido' do
    before do
      pedido = create(:pedido)
      pedido.historico.create({status: 0, descricao: "Seu pedido está aguardando a aprovação do restaurante."})
      get "/api/v1/pedidos/#{pedido.id}/historicos/"
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "returns a historico" do
      json_response = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(json_response["data"].length).to_not eq 0
    end
end