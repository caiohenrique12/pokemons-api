ENV['APP_ENV'] = 'test'

require './app/controllers/pokemons_controller'
require 'test/unit'
require 'rack/test'
require 'pry'

class PokemonsControllerTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    PokemonsController
  end

  def test_it_says_pokemon_name
    get '/api/v1/pokemons/', params= {name: 'bulbasaur'}

    assert last_response.body.include?('Hi bulbasaur')
  end

end