require 'rspec'
require 'dotenv'

# loading the .env file into the environment of rspec using the API key 
Dotenv.load('.env')

RSpec.configure do |config|
  config.formatter = :documentation
end

