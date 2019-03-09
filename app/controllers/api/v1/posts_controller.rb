# frozen_string_literal: true

module Api
  module V1
    class PostsController < ApplicationController
      def index
        render json: PostSerializer.new(Post.all).serializable_hash
      end
    end
  end
end
