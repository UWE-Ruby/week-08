require 'active_record'
require 'yaml'
require 'logger'

database_configuration_file = 'database.yml'

#
# Loads up the database connection information in a Hash. 
#
database_configuration = YAML::load(File.open(database_configuration_file))
  
ActiveRecord::Base.establish_connection database_configuration

#
# Log the database operations to a file to make it easier to troublehsoot what is taking place.
#
ActiveRecord::Base.logger = Logger.new(File.open('database.log', 'a'))

require_relative 'user'
require_relative 'assignment'
