ENV['APP_ENV'] = 'test'

require './app/lib/utils/file_helper'
require 'test/unit'
require 'rack/test'
require 'pry'
require 'json'

class JsonHelperTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    JsonHelper
  end

  def test_if_json_are_saved
    file = File.read('app/test/fixtures/example.json')

    JsonHelper.new(file).save_file

    assert Dir["tmp/files/*.json"].any?
  end

  def test_if_json_are_saved_with_wrong_schema
    file = File.read('app/test/fixtures/bad_example.json')

    JsonHelper.new(file).save_file

    assert Dir["tmp/files/*.json"].any?
  end
end