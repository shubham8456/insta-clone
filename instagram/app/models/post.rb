class Post < ApplicationRecord
    belongs_to :user
    mount_uploader :media, MediaUploader
end
