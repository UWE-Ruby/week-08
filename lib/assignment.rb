class Assignment < ActiveRecord::Base
    
    #
    # This completes the relationship between User and Assigment. Here we are saying:
    # 
    # Every row in the Assignment table has a User that which it belongs.
    #
    # While the user table does not need any special columns to consumate this relationship,
    # the Assigment class needs to store the ID of the user for which it belongs
    #
    # @see db/migrate/002_create_assignments.rb
    #
    belongs_to :user

end
