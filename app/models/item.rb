class Item < ApplicationRecord
	belongs_to :restaurante
	validates :nome, presence: true
	validates :descricao, presence: true
	validates :ingredientes, presence: true
	validates :restaurante, presence: true
end
