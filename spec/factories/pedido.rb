FactoryBot.define do
  factory :pedido do
	restaurante { create(:restaurante) }
	status_pedido { 0 }
  end
end