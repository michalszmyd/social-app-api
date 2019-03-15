# frozen_string_literal: true

module Api
  module V1
    class SessionsController < Devise::SessionsController
      def create
        user = User.find_by(email: session_params[:email])

        if user && user.valid_password?(session_params[:password])
          render json: UserSessionSerializer.new(user).as_json, status: :ok
        else
          render json: { errors: { email_or_password: 'invalid' } }, status: :unprocessable_entity
        end
      end

      def session_params
        params.permit(:email, :password)
      end
    end
  end
end
