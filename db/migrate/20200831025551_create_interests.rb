# frozen_string_literal: true

class CreateInterests < ActiveRecord::Migration[5.2]
  def change
    create_table :interests do |t|
      t.string :shop_name
      t.string :shop_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
