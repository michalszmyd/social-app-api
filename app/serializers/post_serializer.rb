# frozen_string_literal: true

class PostSerializer
  include FastJsonapi::ObjectSerializer

  set_type :post
  set_id :id

  attributes :title, :description

  attribute :user do |object|
    UserSerializer.new(object.user).as_json
  end

  attribute :comments do |object|
    CommentSerializer.new(object.recent_comments).as_json
  end

  attribute :image_url do |object|
    if object.image.attached?
      Rails.application.routes.url_helpers.url_for(object.image)
    else
      ''
    end
  end

  belongs_to :user
end
