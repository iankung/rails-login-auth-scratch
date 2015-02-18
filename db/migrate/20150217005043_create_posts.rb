class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :status
      t.references :cluster, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :posts, :clusters
    add_foreign_key :posts, :users
  end
end
