# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require "sinatra/activerecord"

class PokemonsController < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  configure :development do
    register Sinatra::Reloader
  end

  post '/api/v1/pokemons/create' do
    json_helper = JsonHelper.new(request.body.read).valid_file

    if json_helper.errors
      halt 400, json_helper.errors
    else
      PokemonWorker.perform_async(json_helper.json_file, json_helper.file_name)
      halt 201, 'Success'
    end
  end

  get '/api/v1/pokemons/' do
    "Hi #{params['name']}"
  end

  # get "/api/v1/pokemons/downloads/" do
  # end
end
