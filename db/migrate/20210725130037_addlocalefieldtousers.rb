class Addlocalefieldtousers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :lang_locale, :string, default: :en
  end
end
