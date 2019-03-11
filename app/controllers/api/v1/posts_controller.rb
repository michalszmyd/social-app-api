# frozen_string_literal: true

module Api
  module V1
    class PostsController < BaseController
      def index
        posts = params[:user_id] ? with_user : without_user

        render json: PostSerializer.new(posts).as_json
      end

      def with_user
        Post.where(user_id: params[:user_id])
            .limit(params[:limit])
            .offset(params[:offset])
            .order(created_at: :desc)
      end

      def without_user
        Post.includes(:user)
            .limit(params[:limit])
            .offset(params[:offset])
            .order(created_at: :desc)
      end
    end
  end
end
