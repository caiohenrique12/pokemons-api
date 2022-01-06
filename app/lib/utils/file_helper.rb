require 'securerandom'
require 'json'
require "json-schema"


class JsonHelper
  def initialize(json_file)
    @json_file = JSON.parse(json_file)
    @errors = nil
    @file_name = "#{SecureRandom.hex(16)}_#{DateTime.now.strftime('%Y%m%d%H%M%S')}.json"
  end

  attr_accessor :errors

  def save_file
    save
  end

  private

  attr_reader :json_file, :file_name

  def save
    if valid?
      File.open("tmp/files/#{file_name}", 'w') do |f|
        f.write(json_file)
      end
    else
      self.errors = validate_schema
    end

    self
  end

  def valid?
    validate_schema.empty?
  end

  def validate_schema
    JSON::Validator.fully_validate(schema, @json_file)
  end

  def schema
    JSON.parse(File.read('app/test/fixtures/schema.json'))
  end
end