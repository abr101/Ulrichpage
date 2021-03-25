class AddSubCategoryIdToPostAds < ActiveRecord::Migration[5.2]
  def change
    add_column :post_ads, :sub_category_id, :integer
    add_column :post_ads, :category_id, :integer
    add_column :post_ads, :city_id, :integer
    add_column :post_ads, :state_id, :integer
    add_column :post_ads, :country_id, :integer
    add_column :post_ads, :continent_id, :integer
  end
end
