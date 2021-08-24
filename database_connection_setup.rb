require './lib/database_connection'

if ENV['RACK_ENV'] == 'test'
  DatabaseConnection.setup('spaces_test')
else
  DatabaseConnection.setup('spaces')
end