class TranslationForContinent < ActiveRecord::Migration[5.2]
  def change
  	I18n.with_locale(:es) do
    reversible do |dir|
      dir.up do
        Continent.create_translation_table!({
          :name => :string
        }, {
          :migrate_data => true
        })
      end

      dir.down do
        Continent.drop_translation_table! :migrate_data => true
      end
    end
   end
  end
end
