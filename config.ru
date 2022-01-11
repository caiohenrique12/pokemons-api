require 'rubygems'
require 'bundler'

Bundler.require

require_relative 'app/lib/utils/file_helper'
require_relative 'app/controllers/pokemons_controller'
require 'sidekiq/web'

Sidekiq.configure_server do |config|
  config.redis = { url: ENV['REDIS_URL'] }
end

Sidekiq::Web.use Rack::Session::Cookie, secret: ENV['SESSION_SECRET']
# Sidekiq::Web.use(Rack::Auth::Basic) do |username, password|
#   [username, password] == ['mike blake', 'password']
# end

run Rack::URLMap.new('/' => PokemonsController, '/sidekiq' => Sidekiq::Web) 