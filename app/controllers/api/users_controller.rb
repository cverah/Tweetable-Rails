# frozen_string_literal: true

module Api
  class UsersController < ApiController
    def index
      @users = User.all
      render json: @users, status: :ok
    end
  end
end
