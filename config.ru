require 'rubygems'
require 'bundler'

Bundler.require

require_relative 'app/controllers/pokemons_controller'

run PokemonsController
