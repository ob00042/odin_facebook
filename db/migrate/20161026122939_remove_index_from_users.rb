class RemoveIndexFromUsers < ActiveRecord::Migration[5.0]
  def change
  	remove_index :users, column: :name
  	add_index :users, :name
  end
end
