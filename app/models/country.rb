class Country < ApplicationRecord
  has_many :states
  belongs_to :continent
  has_many :post_ads
end
