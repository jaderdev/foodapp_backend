class Item < ApplicationRecord
	validates :nome, presence: true
	validates :descricao, presence: true
	validates :ingredientes, presence: true
end
