# frozen_string_literal: true

class ProfileUserSerializer
  include FastJsonapi::ObjectSerializer
  set_type :user
  set_id :id
  has_many :posts

  attributes :id, :email, :first_name, :last_name, :posts_count, :profile_image_url
end
