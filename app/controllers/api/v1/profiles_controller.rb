# frozen_string_literal: true

module Api
  module V1
    class ProfilesController < BaseController
      def show
        user = User.find(params[:id])

        render json: ProfileUserSerializer.new(user).as_json
      end

      def my_profile
        render json: ProfileUserSerializer.new(current_user).as_json
      end
    end
  end
end
