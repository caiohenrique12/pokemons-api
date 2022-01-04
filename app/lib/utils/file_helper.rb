require 'securerandom'
require 'json'

class FileHelper
  def initialize(json_file)
    @json_file = json_file
  end

  def call
    save_file
  end

  private

  def save_file
    File.open("tmp/files/#{file_name}", 'w') do |f|
      f.write(JSON.parse(@json_file))
    end
  end

  def file_name
    "#{SecureRandom.hex(16)}_#{DateTime.now.strftime('%Y%m%d%H%M%S')}.json"
  end
end