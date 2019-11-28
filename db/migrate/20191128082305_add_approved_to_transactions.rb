class AddApprovedToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :approved, :boolean
  end
end
