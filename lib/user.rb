#
# All ActiveRecord 'Model' classes extend from ActiveRecord::Base.
#
# This is so they can inherit all the connection information that is established
# in ActiveRecord::Base.
#
class User < ActiveRecord::Base

    # ActiveRecord will automatically find out the available databse columns and
    # map those colums as attribute accessors on the class

    # name is a column in the database because we set up in the database migration
    # @see db/migrate/001_createusers.rb


    # Here we state that the name field must be specified. Otherwise we will not save
    # the name to the database.
    #
    # @see http://guides.rubyonrails.org/active_record_validations_callbacks.html#valid-and-invalid
    validates :name, :presence => true
    
    # We are stating that we have a relationship between Users and Assignments. 
    #
    # A User HAS MANY Assigments.
    #
    # This relationship is defined here and also defined in the Assignment class.
    # @see assignment.rb
    #
    has_many :assignments

end
