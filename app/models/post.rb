class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :recent_comments, -> { order(created_at: :desc).limit(3) },
           foreign_key: 'post_id',
           class_name: 'Comment', inverse_of: :post

  has_one_attached :image

  validates :user_id, :title, :description, presence: true
end
