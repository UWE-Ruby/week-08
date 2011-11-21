require 'active_record'
require 'yaml'
require 'logger'

task :default => :migrate

#
# Uses ActiveRecord's migration functionality to perform a database migration with the specified
# VERSION
#

desc "Migrate the database through scripts in db/migrate. Target specific version with VERSION=x"
task :migrate => :environment do
  
  if ENV["VERSION"]
    ActiveRecord::Migrator.migrate('db/migrate', ENV["VERSION"] ? ENV["VERSION"].to_i : nil )
  else
    puts %{
    No database migration VERSION was specified.

    Example Usage:

      rake migrate VERSION=001
        
    }
  end
    
end

# Load the database environment and log file, this is a pre-requisite step used by the other steps
task :environment do

  #
  # Loads up the database connection information in a Hash. 
  #
  database_configuration = YAML::load(File.open('database.yml'))
  
  ActiveRecord::Base.establish_connection database_configuration

  #
  # Log the database operations to a file to make it easier to troublehsoot what is taking place.
  #
  ActiveRecord::Base.logger = Logger.new(File.open('database.log', 'a'))
end
