# frozen_string_literal: true

class AddShopNameToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :shop_name, :string
  end
end
