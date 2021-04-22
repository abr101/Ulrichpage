class AddZipcodeToPostAds < ActiveRecord::Migration[5.2]
  def change
    add_column :post_ads, :zipcode, :string
  end
end
