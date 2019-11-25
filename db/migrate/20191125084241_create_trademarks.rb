class CreateTrademarks < ActiveRecord::Migration[5.2]
  def change
    create_table :trademarks do |t|
      t.string :skill
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
