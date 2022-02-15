# frozen_string_literal: true

require 'sidekiq'

class PokemonWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'default'

  def perform(json_file, file_name)
    f = File.new("tmp/files/#{file_name}", 'w')
    f.write(json_file)
    f.close
  end
end
