class Pedido < ApplicationRecord
  belongs_to :restaurante
  has_many :item
  has_many :historico

  validates :restaurante, presence: true
  validates :status_pedido, presence: true
end
