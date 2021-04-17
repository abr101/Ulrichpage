class Continent < ApplicationRecord
  has_many :countries
  has_many :post_ads
  translates :name, touch: true, :fallbacks_for_empty_translations => true
end
