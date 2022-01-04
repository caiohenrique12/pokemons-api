ENV['APP_ENV'] = 'test'

require './app/lib/utils/file_helper'
require 'test/unit'
require 'rack/test'
require 'pry'
require 'json'

class FileHelperTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    FileHelper
  end

  def test_if_json_are_saved
    file = File.read('app/test/fixtures/example.json')
    file_json = JSON.parse(file)

    FileHelper.new(file).call

    assert Dir["tmp/files/*.json"].any?
  end
end