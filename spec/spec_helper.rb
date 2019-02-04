require 'rspec'
require 'dotenv'
require_relative '../lib/new_york_times'

# loading the .env file into the environment of rspec using the API key 
Dotenv.load('.env')

RSpec.configure do |config|
  config.formatter = :documentation
end

