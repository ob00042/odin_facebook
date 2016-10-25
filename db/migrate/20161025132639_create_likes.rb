class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|

      t.timestamps
    end
   add_column :likes, :user_id, :integer
   add_column :likes, :post_id, :integer
  end
end
