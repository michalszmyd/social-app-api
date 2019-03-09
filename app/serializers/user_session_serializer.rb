# frozen_string_literal: true

class UserSessionSerializer
  include FastJsonapi::ObjectSerializer
  set_type :user
  set_id :id

  attributes :id, :email
  attribute :token do |object|
    JwtService.encode(id: object.id,
                      timestamp: Time.current)
  end
end
