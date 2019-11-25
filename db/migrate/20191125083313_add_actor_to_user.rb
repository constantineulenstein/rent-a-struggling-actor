class AddActorToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :actor, :boolean, default: false
  end
end
