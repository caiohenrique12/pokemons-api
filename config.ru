require 'rubygems'
require 'bundler'

Bundler.require

require_relative 'app/lib/utils/file_helper'
require_relative 'app/controllers/pokemons_controller'

run PokemonsController
