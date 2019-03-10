# frozen_string_literal: true

module Api
  module V1
    class PostsController < BaseController
      def index
        render json: PostSerializer.new(Post.includes(:user)).as_json
      end
    end
  end
end
