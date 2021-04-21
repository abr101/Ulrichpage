class CreateDashboard < ActiveRecord::Migration[5.2]
  def change
    create_table :dashboards do |t|
    	t.text :description
    	t.integer :page_type
    	
    	t.timestamps
    end
  end
end
