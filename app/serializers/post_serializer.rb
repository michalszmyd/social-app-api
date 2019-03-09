# frozen_string_literal: true

class PostSerializer
  include FastJsonapi::ObjectSerializer
  set_type :post
  set_id :id

  attributes :title, :description

  belongs_to :user
end
