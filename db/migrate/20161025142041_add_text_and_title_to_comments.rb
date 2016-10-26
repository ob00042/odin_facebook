class AddTextAndTitleToComments < ActiveRecord::Migration[5.0]
  def change
  	add_column :comments, :title, :string
  	add_column :comments, :text, :text
  end
end
