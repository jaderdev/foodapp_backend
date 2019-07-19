class AddStatusToHistorico < ActiveRecord::Migration[5.2]
  def change
    add_column :historicos, :status, :integer
  end
end
