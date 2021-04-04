class AddColumnsToPostAds < ActiveRecord::Migration[5.2]
  def change
    add_column :post_ads, :price, :integer
    add_column :post_ads, :negotiable, :boolean
    add_column :post_ads, :personal, :boolean
    add_column :post_ads, :business, :boolean
    remove_column :post_ads, :continent_id, :integer
    remove_column :post_ads, :state_id, :integer
  end
end
