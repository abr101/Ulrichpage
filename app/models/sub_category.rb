class SubCategory < ApplicationRecord
  has_many :post_ads
  belongs_to :category
end
