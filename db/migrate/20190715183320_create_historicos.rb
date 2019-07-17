class CreateHistoricos < ActiveRecord::Migration[5.2]
  def change
    create_table :historicos do |t|
      t.references :pedido, foreign_key: true
      t.text :descricao

      t.timestamps
    end
  end
end
