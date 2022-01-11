require 'sidekiq'

class PokemonWorker
  include Sidekiq::Worker

  def perform(*args)

  end
end