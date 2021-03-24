class PostAd < ApplicationRecord
  mount_uploaders :avatars, ImageUploader

  belongs_to :user
end
