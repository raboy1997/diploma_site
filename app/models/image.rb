class Image < ApplicationRecord
  max_paginates_per 5
  mount_uploader :image, ImageUploader

  belongs_to :user

  has_many :comments, dependent: :destroy

  scope :of_followed_users, -> (following_users) { where user_id: following_users }

end
