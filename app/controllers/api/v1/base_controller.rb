# frozen_string_literal: true

module Api
  module V1
    class BaseController < ApplicationController
      respond_to :json

      before_action :authenticate_api_v1_user!
    end
  end
end