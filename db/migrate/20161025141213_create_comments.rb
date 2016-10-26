class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|

      t.timestamps
    end
    add_column :comments, :user_id, :integer
    add_column :comments, :post_id, :integer
    add_index :comments, :user_id
    add_index :comments, :post_id
  end
end
