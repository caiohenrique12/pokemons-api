require 'securerandom'
require 'json'
require "json-schema"

class JsonHelper
  attr_accessor :json_file, :file_name, :errors

  def initialize(json_file)
    @json_file = JSON.parse(json_file)
    @errors = nil
    @file_name = "#{SecureRandom.hex(16)}_#{DateTime.now.strftime('%Y%m%d%H%M%S')}.json"
  end

  def valid_file
    if invalid?
      self.errors = validate_schema
    end

    self
  end

  private

  def invalid?
    !valid?
  end

  def valid?
    validate_schema.empty?
  end

  def validate_schema
    JSON::Validator.fully_validate(schema, json_file)
  end

  def schema
    JSON.parse(File.read('app/test/fixtures/schema.json'))
  end
end