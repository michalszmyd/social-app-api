# frozen_string_literal: true

class CommentSerializer
  include FastJsonapi::ObjectSerializer
  set_type :comment
  set_id :id
  belongs_to :user

  attributes :id, :body

  attribute :user do |object|
    UserSerializer.new(object.user).as_json
  end
end
