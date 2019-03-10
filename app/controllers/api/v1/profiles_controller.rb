# frozen_string_literal: true

module Api
  module V1
    class ProfilesController < BaseController
      def show
        render json: UserSerializer.new(user).as_json
      end

      private

      def user
        @user ||= User.find(params[:id]) || current_user
      end
    end
  end
end
