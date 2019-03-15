# frozen_string_literal: true

class UserSerializer
  include FastJsonapi::ObjectSerializer
  set_type :user
  set_id :id

  attributes :id, :email, :first_name, :last_name

  attribute :profile_image_url do |object|
    if object.profile_image.attached?
      Rails.application.routes.url_helpers.url_for(object.profile_image)
    else
      ''
    end
  end
end
