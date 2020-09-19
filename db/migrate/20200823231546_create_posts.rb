class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :content
      t.references :user, foreign_key: true
      t.string :eval
      t.string :shop_id

      t.timestamps
    end
  end
end
