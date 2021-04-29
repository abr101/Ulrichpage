class PostAd < ApplicationRecord
  mount_uploaders :avatars, ImageUploader
  belongs_to :user
  enum status: {stopped: 0, running: 1}
  belongs_to :sub_category
  has_many :replies
  has_one_attached :clip
  #mount_uploader :video, VideoUploader 
  # belongs_to :continent
  # belongs_to :country
  # belongs_to :state
  belongs_to :city
  belongs_to :category
  # belongs_to :user
end
