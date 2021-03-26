class Category < ApplicationRecord
  has_many :sub_categories
  belongs_to :city
  has_many :post_ads
end
