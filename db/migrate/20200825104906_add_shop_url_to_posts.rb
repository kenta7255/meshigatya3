# frozen_string_literal: true

class AddShopUrlToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :shop_url, :text, limit: 2000
  end
end
