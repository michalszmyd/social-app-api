# frozen_string_literal: true

class UserSerializer
  include FastJsonapi::ObjectSerializer
  set_type :user
  set_id :id

  attributes :id, :email, :first_name, :last_name, :profile_image_url
end
