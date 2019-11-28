class AddPricePerHourToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :price_per_hour, :integer
  end
end
