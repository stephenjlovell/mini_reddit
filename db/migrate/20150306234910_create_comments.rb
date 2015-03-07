class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :text
      t.integer :user_id
      t.integer :post_id
      t.integer :parent_id

      t.timestamps null: false
    end
  end
end
