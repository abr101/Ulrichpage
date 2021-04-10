class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.references :user, foreign_key: true
      t.references :post_ad, foreign_key: true
      t.boolean :status, default: true

      t.timestamps
    end
  end
end
