class Continent < ApplicationRecord
  has_many :countries
  has_many :post_ads
end
