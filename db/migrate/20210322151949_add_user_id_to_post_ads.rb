class AddUserIdToPostAds < ActiveRecord::Migration[5.2]
  def change
    add_column :post_ads, :user_id, :integer
  end
end
