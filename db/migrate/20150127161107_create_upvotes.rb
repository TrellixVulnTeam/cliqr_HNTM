class CreateUpvotes < ActiveRecord::Migration
  def change
    create_table :upvotes do |t|
      t.references :user
      t.references :vote, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
