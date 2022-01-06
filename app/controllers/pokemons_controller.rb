require 'sinatra/base'
require "sinatra/reloader"
require 'pry'

class PokemonsController < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  post '/api/v1/pokemons/create' do
    json_helper = JsonHelper.new(request.body.read).save_file

    if json_helper.errors
      halt 400, json_helper.errors
    else
      halt 201, 'Success'
    end
  end

  get '/api/v1/pokemons/' do
    "Hi #{params['name']}"
  end

  get '/api/v1/pokemons/downloads/' do
  end
end