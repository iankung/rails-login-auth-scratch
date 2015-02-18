class CreateSubs < ActiveRecord::Migration
  def change
    create_table :subs do |t|
      t.references :user, index: true
      t.references :cluster, index: true

      t.timestamps null: false
    end
    add_foreign_key :subs, :users
    add_foreign_key :subs, :clusters
  end
end
