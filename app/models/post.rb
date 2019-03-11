class Post < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  validates :user_id, :title, :description, presence: true
end
