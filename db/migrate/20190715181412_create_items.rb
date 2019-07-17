class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :nome
      t.text :descricao
      t.integer :tempo_preparo
      t.text :ingredientes

      t.timestamps
    end
  end
end
