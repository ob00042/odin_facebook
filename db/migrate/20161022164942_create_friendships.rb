class CreateFriendships < ActiveRecord::Migration[5.0]
  def change
  	drop_table :friendships
  	
    create_table :friendships do |t|
      t.references :user, foreign_key: true
      t.integer :friend_id, foreign_key: true

      t.timestamps
    end
  end
end
