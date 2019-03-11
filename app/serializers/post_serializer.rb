# frozen_string_literal: true

class PostSerializer
  include FastJsonapi::ObjectSerializer

  set_type :post
  set_id :id

  attributes :title, :description, :user

  attribute :image_url do |object|
    if object.image.attached?
      Rails.application.routes.url_helpers.url_for(object.image)
    else
      ''
    end
  end

  belongs_to :user
end
