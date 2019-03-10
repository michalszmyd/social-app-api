# frozen_string_literal: true

class PostSerializer
  include FastJsonapi::ObjectSerializer
  set_type :post
  set_id :id

  attributes :title, :description, :user

  belongs_to :user
end
