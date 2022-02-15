# frozen_string_literal: true

ENV['APP_ENV'] = 'test'

require './app/controllers/pokemons_controller'
require './app/lib/utils/file_helper'
require 'test/unit'
require 'rack/test'
require 'pry'

class PokemonsControllerTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    PokemonsController
  end

  def test_if_create_is_success
    json_file = File.read('app/test/fixtures/example.json')

    post '/api/v1/pokemons/create', json_file, { 'CONTENT_TYPE' => 'application/json' }

    assert_equal last_response.status, 201
  end

  def test_if_create_is_unsuccess
    json_file = File.read('app/test/fixtures/bad_example.json')

    post '/api/v1/pokemons/create', json_file, { 'CONTENT_TYPE' => 'application/json' }

    assert_equal last_response.status, 400
  end

  def test_it_says_pokemon_name
    get '/api/v1/pokemons/', params = { name: 'bulbasaur' }

    assert last_response.body.include?('Hi bulbasaur')
  end
end
