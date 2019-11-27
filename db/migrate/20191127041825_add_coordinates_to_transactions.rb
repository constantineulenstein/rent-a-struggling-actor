class AddCoordinatesToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :latitude, :float
    add_column :transactions, :longitude, :float
  end
end
