module ExceptionHandler
  extend ActiveSupport::Concern

  class InvalidParameter < StandardError; end
  class InvalidToken < StandardError; end
  class MissingToken < StandardError; end

  included do
    rescue_from ExceptionHandler::InvalidParameter, with: :unprocessable_request
    rescue_from ExceptionHandler::InvalidToken, with: :unauthorized_request
    rescue_from ExceptionHandler::MissingToken, with: :unauthorized_request
  end

  private

  def unprocessable_request(error)
    json_response({ errors: [{ status: 'UNPROCESSABLE_REQUEST_ERROR', msg: error.message }] }, :bad_request)
  end

  def unauthorized_request(error)
    json_response({ errors: [{ status: 'UNAUTHORIZED_REQUEST_ERROR', msg: error.message }] }, :unauthorized)
  end
end
