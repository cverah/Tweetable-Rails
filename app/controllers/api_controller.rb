# frozen_string_literal: true

class ApiController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { message: e.message }, status: :not_found
  end

  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :authorize

  def current_user
    @current_user ||= authenticate_token
  end

  def authorize
    authenticate_token || respond_unauthorized('Access denied')
  end

  private

  def respond_unauthorized(message)
    error = { unauthorized: message }
    render json: error, status: :unauthorized
  end

  def authenticate_token
    authenticate_with_http_token do |token, _options|
      ApiUser.find_by(token:)
    end
  end
end
