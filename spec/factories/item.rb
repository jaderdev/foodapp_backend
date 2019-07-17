# This will guess the User class
FactoryBot.define do
  factory :item do
    nome {Faker::Food.ingredient}
    descricao {Faker::Lorem.sentence} 
    ingredientes {Faker::Lorem.sentence}
  end
end
