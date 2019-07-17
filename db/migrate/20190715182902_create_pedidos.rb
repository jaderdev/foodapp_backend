class CreatePedidos < ActiveRecord::Migration[5.2]
  def change
    create_table :pedidos do |t|
      t.references :restaurante, foreign_key: true
      t.references :item, foreign_key: true
      t.integer :status_pedido

      t.timestamps
    end
  end
end
