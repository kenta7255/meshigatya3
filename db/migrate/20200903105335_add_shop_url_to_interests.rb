class AddShopUrlToInterests < ActiveRecord::Migration[5.2]
  def change
    add_column :interests, :shop_url, :string
  end
end
