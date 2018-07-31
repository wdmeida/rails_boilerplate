class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  # before_action :authorize_request

  private

  def authorize_request
    AuthorizeApiRequest.new(request.headers).call
  end
end
