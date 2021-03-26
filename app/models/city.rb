class City < ApplicationRecord
  has_many :categories
  belongs_to :state
  has_many :post_ads
end
