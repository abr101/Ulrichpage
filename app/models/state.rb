class State < ApplicationRecord
  has_many :cities
  belongs_to :country
  has_many :post_ads
end
