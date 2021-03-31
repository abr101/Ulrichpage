class City < ApplicationRecord
  has_many :categories
  belongs_to :country
  has_many :post_ads
end
