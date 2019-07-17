require 'rails_helper'

describe 'Customer consult restaurantes' do
    before do
      get '/api/v1/restaurantes'
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
end


describe 'Customer get a restaurante' do
  restaurante = Restaurante.create({nome:Faker::Company.bs,nome_fantasia: Faker::Company.name, cnpj: Faker::Company.brazilian_company_number, hora_abertura: Time.now, hora_fechamento: 8.hour.after})

    before do
      get "/api/v1/restaurantes/#{restaurante.id}"
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "JSON body response contains expected restaurante" do
      json_response = JSON.parse(response.body)
      expect(json_response["nome"]).to_not eq ""
      expect(json_response["data"].length).to_not eq 0
      expect(json_response["data"]["nome"]).to eq restaurante.nome
    end
end

describe 'Customer create a restaurante' do
  restaurante = Restaurante.new({nome:Faker::Company.bs, nome_fantasia: Faker::Company.name, cnpj: Faker::Company.brazilian_company_number, hora_abertura: Time.now, hora_fechamento: 8.hour.after
})

    it "with success" do
      post "/api/v1/restaurantes/", params: { nome:restaurante.nome, nome_fantasia: restaurante.nome_fantasia, cnpj: restaurante.cnpj, hora_abertura: restaurante.hora_abertura, hora_fechamento: restaurante.hora_fechamento }
      expect(response).to have_http_status(:success)
      json_response = JSON.parse(response.body)
      expect(json_response["data"]["nome"]).to eq restaurante.nome
    end

    it "with error" do
      post "/api/v1/restaurantes/", params: {nome:restaurante.nome, nome_fantasia: restaurante.nome_fantasia, cnpj: restaurante.cnpj, hora_abertura: restaurante.hora_abertura}
      json_response = JSON.parse(response.body)
      expect(response).to have_http_status("412")
    end
end

describe 'Customer update a restaurante' do
  	restaurante = Restaurante.create({nome:Faker::Company.bs, nome_fantasia: Faker::Company.name, cnpj: Faker::Company.brazilian_company_number, hora_abertura: Time.now, hora_fechamento: 8.hour.after
})
    
    it "with success" do
      put "/api/v1/restaurantes/#{restaurante.id}", params: {nome:restaurante.nome, nome_fantasia: restaurante.nome_fantasia, cnpj: restaurante.cnpj, hora_abertura: restaurante.hora_abertura}
      expect(response).to have_http_status(:success)
      json_response = JSON.parse(response.body)
      expect(json_response["data"]["nome"]).to eq restaurante.nome
    end

    it "with error" do
      skip
      put "/api/v1/restaurantes/#{restaurante.id}", params: {nome:restaurante.nome, nome_fantasia: restaurante.nome_fantasia, cnpj: restaurante.cnpj, hora_abertura: restaurante.hora_abertura}
      expect(response).to_not have_http_status(:success)
      json_response = JSON.parse(response.body)
      expect(json_response["status"]).to eq "ERROR"
    end
end

describe 'Customer delete an restaurante' do
  	restaurante = Restaurante.create({nome:Faker::Company.bs, nome_fantasia: Faker::Company.name, cnpj: Faker::Company.brazilian_company_number, hora_abertura: Time.now, hora_fechamento: 8.hour.after
})
    
    it "with success" do
      delete "/api/v1/restaurantes/#{restaurante.id}"
      expect(response).to have_http_status(:success)
      json_response = JSON.parse(response.body)
    end

    it "with error" do
    skip
      put "/api/v1/restaurantes/#{restaurante.id}", params: {nome:restaurante.nome, nome_fantasia: restaurante.nome_fantasia, cnpj: restaurante.cnpj, hora_abertura: restaurante.hora_abertura}
      expect(response).to_not have_http_status(:success)
      json_response = JSON.parse(response.body)
      expect(json_response["status"]).to eq "ERROR"
    end
end