# frozen_string_literal: true

class JwtService
  SALT = 'abcdef'.freeze

  def self.encode(payload)
    JWT.encode(payload, SALT, 'HS256')
  end

  def self.decode(payload)
    JWT.decode(payload, SALT, 'HS256')
  end
end
