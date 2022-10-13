class Post < ApplicationRecord
    mount_uploader :media, MediaUploader

    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
end
