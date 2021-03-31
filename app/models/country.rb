class Country < ApplicationRecord
  has_many :cities
  belongs_to :continent
  has_many :post_ads
end
