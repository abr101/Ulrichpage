class PostAd < ApplicationRecord
  mount_uploaders :avatars, ImageUploader
  belongs_to :user
  # belongs_to :sub_category
  # belongs_to :continent
  # belongs_to :country
  # belongs_to :state
  # belongs_to :city
  # belongs_to :category
  # belongs_to :user
end
