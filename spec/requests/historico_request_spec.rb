require 'rails_helper'

describe 'Costumer consult historicos from a pedido' do
    before(:each) do
      pedido = create(:pedido)
      historico =  pedido.historico.create({status: 0, descricao: "Seu pedido está aguardando a aprovação do restaurante."})
      get "/api/v1/pedidos/#{pedido.id}/historicos/"
    end

    it "successfully" do
      expect(response.content_type).to eq('application/json')
      expect(response).to have_http_status(:success)
      json_response = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(json_response["data"].length).to_not eq 0
      expect(json_response["data"][0]["descricao"]).to eq "Seu pedido está aguardando a aprovação do restaurante."
    end
end