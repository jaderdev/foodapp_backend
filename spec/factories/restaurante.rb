# This will guess the User class
FactoryBot.define do
  factory :restaurante do
	nome { Faker::Company.bs}
	nome_fantasia { Faker::Company.name}
	cnpj { Faker::Company.brazilian_company_number}
	hora_abertura { Time.now}
	hora_fechamento { 8.hour.after }
  end
end
