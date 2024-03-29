# frozen_string_literal: true

module Api
  module V1
    class PostsController < BaseController
      def index
        posts = params[:user_id] ? with_user : without_user

        render json: PostSerializer.new(
          posts.includes(:user, :recent_comments)
        ).as_json
      end

      def show
        post = Post.find(params[:id])

        render json: PostSerializer.new(post).as_json
      end

      def create
        form = PostForm.new(post_params.merge(user_id: current_user.id))
        form.save
        post = form.post

        if post
          render json: { id: post.id }, stauts: :ok
        else
          render json: { error: post.errors.full_messages.join(', ') }, status: :unprocessable_entity
        end
      end

      private

      def post_params
        params.require(:post).permit(:title, :description, :image)
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
