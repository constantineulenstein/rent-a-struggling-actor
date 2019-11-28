class AddOptionalTitleToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :optional_title, :string
  end
end
