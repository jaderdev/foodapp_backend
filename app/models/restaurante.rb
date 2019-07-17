class Restaurante < ApplicationRecord
	has_many :pedido
	has_many :item

	validates :nome, presence: true
	validates :nome_fantasia, presence: true
	validates :cnpj, presence: true
	validates :hora_abertura, presence: true
	validates :hora_fechamento, presence: true
end
