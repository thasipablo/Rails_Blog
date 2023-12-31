class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.integer :comments_counter
      t.integer :likes_counter
      t.integer :author_id, null: false
      
      t.timestamps
    end
    add_foreign_key :posts, :users, column: :author_id
  end
end
