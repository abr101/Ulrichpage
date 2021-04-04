class AddStatusToPostAds < ActiveRecord::Migration[5.2]
  def change
    add_column :post_ads, :status, :integer, default: 0
  end
end
