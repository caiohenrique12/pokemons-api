require 'jwt'

class Authentication
  def initialize(username, password)
    @username = username
    @password = password
    @token = nil
  end

  def login; end

  private

  attr_reader :username, :password

  def user; end

  def token
    JWT.encode(payload(username), ENV['JWT_SECRET'], 'HS256')
  end

  def payload
    {
      exp:    Time.now.to_i + (60 * 60),
      iat:    Time.now.to_i,
      iss:    ENV['JWT_ISSUER'],
      scopes: [],
      user:   {
        username: username
      }
    }
  end
end
