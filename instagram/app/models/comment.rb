class Comment < ApplicationRecord
    belongs_to :post
    belongs_to :user

    validates_presence_of :user_id
    validates_presence_of :post_id
    validates_presence_of :comment_text

    belongs_to :parent, class_name: :comment, optional: true
    has_many :comments, foreign_key: :parent_id
end
