class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.datetime :date
      t.string :location
      t.text :description
      t.references :trademark, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
