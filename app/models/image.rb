class Image < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :user

  has_many :comments, dependent: :destroy

  scope :of_followed_users, -> (following_users) { where user_id: following_users }

end
