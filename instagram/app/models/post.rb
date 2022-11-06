class Post < ApplicationRecord
    mount_uploader :media, MediaUploader
    validates :media, presence: true

    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
end
