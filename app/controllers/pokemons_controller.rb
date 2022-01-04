require 'sinatra/base'
require "sinatra/reloader"
require 'pry'

class PokemonsController < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  post '/api/v1/pokemons/create' do
    FileHelper.new(request.body.read).call

    status 200
  end

  get '/api/v1/pokemons/' do
    "Hi #{params['name']}"
  end

  get '/api/v1/pokemons/downloads/' do
  end
end