# API POR QUE ESTA DENTRO DE UNA CARPETA API EL CONTROLADOR
class Api::SessionsController < ApiController
  skip_before_action :authorize, only: :create

  def create
    user = ApiUser.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      user.regenerate_token
      render json: { email: user.email, token: user.token }
    else
      respond_unauthorized('Incorrect email or password')
    end
  end

  def destroy
    current_user.invalidate_token
    head :ok
  end
end
