class Post < ApplicationRecord
    mount_uploader :media, MediaUploader
end
