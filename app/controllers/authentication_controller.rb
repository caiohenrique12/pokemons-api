require 'sinatra/base'
require 'sinatra/reloader'

class AuthenticationController < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  post '/login' do
    authentication = Authentication.new(params[:username], params[:password])

    if authentication.login
      content_type :json
      { token: authentication.token }.to_json
    else
      halt 401
    end
  end
end