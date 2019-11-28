class AddPricePerHourToTrademarks < ActiveRecord::Migration[5.2]
  def change
    add_column :trademarks, :price_per_hour, :integer
  end
end
