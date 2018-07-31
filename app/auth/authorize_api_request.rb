class AuthorizeApiRequest
  def initialize(headers = {})
    @headers = headers
  end

  def call
    {
      user: user
    }
  end

  private

  attr_reader :headers

  def user
    @user ||= decoded_auth_token.first if decoded_auth_token
    unless @user['client'] == ENV['AUTH_CLIENT']
      raise ExceptionHandler::InvalidToken, I18n.t('errors.request.invalid_token')
    end
  rescue JWT::DecodeError
    raise ExceptionHandler::InvalidToken, I18n.t('errors.request.invalid_token')
  end

  def decoded_auth_token
    @decoded_auth_token ||= JWT.decode(http_auth_header, ENV['HMAC_SECRET'], true, algorithm: 'HS256')
  end

  def http_auth_header
    return headers['Authorization'].split(' ').last if headers['Authorization'].present?
    raise ExceptionHandler::MissingToken, I18n.t('errors.request.missing_token')
  end
end
