ENV['APP_ENV'] = 'test'

require "./fast_sinatra"
require 'test/unit'
require 'rack/test'
require 'pry'

class PokemonsControllerTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    builder = Rack::Builder.new
    builder.run FastSinatra
  end

  def test_it_says_pokemon_name
    get '/api/v1/pokemons/', params= {name: 'bulbasaur'}
    binding.pry
    assert last_response.body.include?('bulbasaur')
  end

end