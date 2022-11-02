# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require "sinatra/activerecord"

class AuthenticationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension

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
