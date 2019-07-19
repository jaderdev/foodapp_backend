class Historico < ApplicationRecord
  belongs_to :pedido

  validates :pedido, presence: true
  validates :descricao, presence: true
  validates :status, presence: true
end
