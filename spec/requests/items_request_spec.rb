require 'rails_helper'

describe 'Customer get items' do
    it "successfuly" do
      item = create(:item)
      item2 = create(:item)

      get '/api/v1/items'

      expect(response.content_type).to eq('application/json')
      expect(response).to have_http_status(:success)
      json_response = JSON.parse(response.body)
      expect(json_response["data"].length).to_not eq 0
      expect(json_response["data"][0]["nome"]).to eq item.nome
      expect(json_response["data"][1]["nome"]).to eq item2.nome
    end
end


describe 'Customer get an item' do
    it "successfuly" do
      pizza = create(:item)
      get "/api/v1/items/#{pizza.id}"
      expect(response).to have_http_status(:success)
      json_response = JSON.parse(response.body)
      expect(json_response["nome"]).to_not eq ""
      expect(json_response["data"].length).to_not eq 0
      expect(json_response["data"]["nome"]).to eq pizza.nome
    end
end

# describe 'Customer create an item' do
#     restaurante = nil
#     item = nil
#     before do
#       restaurante = create(:restaurante)
#     	item = Item.new({nome:Faker::Food.ingredient,descricao: Faker::Lorem.sentence, ingredientes: Faker::Food.ingredient,
#                        restaurante: restaurante})
#       byebug
#     end

#     it "with success" do
#       post "/api/v1/items/", params: {nome:item.nome,descricao: item.descricao, ingredientes: item.ingredientes, 
#                                       restaurante: item.restaurante}
#       expect(response).to have_http_status(:success)
#       json_response = JSON.parse(response.body)
#       expect(json_response["data"]["nome"]).to eq item.nome
#     end

#     it "with error" do
#       post "/api/v1/items/", params: {nome:item.nome,descricao: item.descricao}
#       expect(response).to have_http_status("412")
#     end
# end

# describe 'Customer update an item' do
#   	item = Item.create({nome:Faker::Food.ingredient,descricao: Faker::Lorem.sentence, ingredientes: Faker::Food.ingredient})
    
#     before do
#     end

#     it "with success" do
#       put "/api/v1/items/#{item.id}", params: {nome:item.nome,descricao: item.descricao, ingredientes: item.ingredientes}
#       expect(response).to have_http_status(:success)
#       json_response = JSON.parse(response.body)
#       expect(json_response["data"]["nome"]).to eq item.nome
#     end
#     it "with error" do
#     skip
#       put "/api/v1/items/#{item.id}", params: {nome:item.nome,descricao: item.descricao}
#       expect(response).to_not have_http_status(:success)
#       json_response = JSON.parse(response.body)
#       expect(json_response["status"]).to eq "ERROR"
#     end
# end

# describe 'Customer delete an item' do
#   	item = Item.create({nome:Faker::Food.ingredient,descricao: Faker::Lorem.sentence, ingredientes: Faker::Food.ingredient})
    
#     before do
#     end

#     it "with success" do
#       delete "/api/v1/items/#{item.id}"
#       expect(response).to have_http_status(:success)
#       json_response = JSON.parse(response.body)
#     end

#     it "with error" do
#     skip
#       put "/api/v1/items/#{item.id}", params: {nome:item.nome,descricao: item.descricao}
#       expect(response).to_not have_http_status(:success)
#       json_response = JSON.parse(response.body)
#       expect(json_response["status"]).to eq "ERROR"
#     end
# end