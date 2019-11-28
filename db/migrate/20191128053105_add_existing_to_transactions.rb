class AddExistingToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :existing, :boolean, default: true
  end
end
