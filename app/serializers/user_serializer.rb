# frozen_string_literal: true

class UserSerializer
  include FastJsonapi::ObjectSerializer
  set_type :user
  set_id :id
  has_many :posts

  attributes :id, :email
end
