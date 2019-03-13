# frozen_string_literal: true

module Api
  module V1
    class CommentsController < BaseController
      skip_before_action :verify_authenticity_token

      def index
        post = Post.find(params[:post_id])

        post.comments.order(created_at: :desc)
      end

      def create
        post = Post.find(params[:post_id])
        comment = post.comments.new(comment_params.merge(user_id: current_user.id))

        if comment.save
          render json: CommentSerializer.new(comment).as_json
        else
          render json: { error: 'Can\'t add comment' }, status: :unprocessable_entity
        end
      end

      private

      def comment_params
        params.require(:comment).permit(:body)
      end
    end
  end
end
