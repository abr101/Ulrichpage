class CreatePostAds < ActiveRecord::Migration[5.2]
  def change
    create_table :post_ads do |t|
      t.string :title
      t.text :description
      t.string :location
      t.string :phone
      t.string :keywords
      t.string :email
      t.boolean :get_response
      t.boolean :terms_privacy
      t.string :images

      t.timestamps
    end
  end
end
