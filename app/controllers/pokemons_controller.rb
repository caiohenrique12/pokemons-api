require 'sinatra/base'
require "sinatra/reloader"
require 'pry'
require 'app/lib/utils/file_helper'

class PokemonsController < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  post '/api/v1/pokemons/create' do
    Utils::FileHelper.new(request.body.read).call

    status 200
  end

  get '/api/v1/pokemons/:name' do
    "#{params['name']}"
  end

  get '/api/v1/pokemons/downloads/:name' do
  end
end