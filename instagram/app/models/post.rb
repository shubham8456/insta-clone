class Post < ApplicationRecord
    mount_uploader :media, MediaUploader

    belongs_to :user
    has_many :comments
end
