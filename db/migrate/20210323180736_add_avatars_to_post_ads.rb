class AddAvatarsToPostAds < ActiveRecord::Migration[5.2]
  def change
    add_column :post_ads, :avatars, :json
  end
end
