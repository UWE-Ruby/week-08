class CreateAssignments < ActiveRecord::Migration

    #
    # Change is new syntax to Rails 3.1. Before you would define an `up` step and a `down` step.
    # Rails migration is intelligent enough to handle most simple setUP and tearDOWN steps so they
    # simply ask you to write what is changed by this migration
    #
    
  def change
    create_table :assignments do |t|

      # Each assignment has a name i.e. week-01, week-02
      t.string :name
      # Each assignment has a repository where the code lives
      t.string :repository
      # Each assignment belongs to a User, which we reference by their user id
      t.references :user

      t.timestamps
    end
  end

end
