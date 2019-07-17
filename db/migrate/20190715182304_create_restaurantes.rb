class CreateRestaurantes < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurantes do |t|
      t.string :nome
      t.string :nome_fantasia
      t.string :cnpj
      t.date :hora_abertura
      t.date :hora_fechamento

      t.timestamps
    end
  end
end
