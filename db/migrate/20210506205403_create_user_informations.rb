class CreateUserInformations < ActiveRecord::Migration[5.2]
  def change
    create_table :user_informations do |t|
      t.string :email
      t.string :name
      t.string :address
      t.string :phone
      t.string :zipcode
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
