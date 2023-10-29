class Api::UsersController < ApiController
  def index
    @users = User.all
    render json: @users, status: :ok
  end
end