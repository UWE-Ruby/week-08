# Week 8

## Introduction

Last exercise we briefly covered reading and writing (persisting data) content with some very popular file format. `YAML` is tool of choice for configuration data and maybe small amonts of data. `JSON` and `XML` are fairly standard ways to communicate that data to other services. While the three of these definitely capable of scaling with your need to contain more data, often people use databases to model their relationships and provide consistent ways to manage the schema of the data.

With Rails on the horizon it is important to spend a moment introducing you to one of it's cornerstones: **ActiveRecord**. **ActiveRecord** provides Rails with it's ability to talk with various databases. It acts as a Object-Relationship Mapping (ORM) between various databases and Ruby data. Most importantly this is done with elegance and ease.

### Outline

#### Exercise

* Fork and clone this repository
* Run Bundler
* Execute the database migrations
* Run the tests / Setup Guard
* Fix the examples
* Commit and push your changes back to Github

#### Reading

* Exception
* RSpec Testing Expections
* ActiveRecord Migrations
* ActiveRecord Validations
* ActiveRecord Associations

## Exercise

The exercise is similar to most every exercise. Save for the requirement to run the **database migrations** to prepare our database.

* Fork and clone this repository
* Run Bundler
* Execute the database migrations
* Run the tests / Setup Guard
* Fix the examples
* Commit and push your changes back to Github

### What is a database migration?

Before we use the database we need to create various tables within the database. Traditionally, if you have worked with databases, this is where you would start writing SQL scripts or start up a visual database client. However, Rails developers do it different by creating text files that define each step in the database creation process.

This first makes it easier to share the layout of the database with other developers and systems. It makes it easier to also manage changes when multiple users are working on a database.

Let's look at one of the migrations `db/migrate/001_create_users.rb:

```Ruby
class CreateUsers < ActiveRecord::Migration

  def change
    create_table :users do |t|
      t.string :name

      t.timestamps
    end
  end

end
```

* The first part of migration file name contains a number, here we have given it the arbitrary number 001. Often times the date appears here. The importance is that the each future migration have a greater number than the previous.

* The second part of the migration file describes what the migration will attempt to do. The name `001_create_users.rb` matches the class name `CreateUsers` removing underscores and capitalizing first letters of each word.

* Each migration contains a class which will match the name of the file as described above. It also extends from the parent `ActiveRecord::Migration` class.

* The method `change` defined within the class is the operations of the migration. Within that change method there is a Domain Specific Language (DSL) that is defined to help us create tables with the appropriate columns.

### Execute the database migration

Inside the Rakefile there are some tasks defined to help us create a connection to the database and perform the migrations. Running the highest numbered migration will run all the previous migrations for you:

```bash
$ rake migrate VERSION=002
```

The output should hopefully look something like the following:

```
==  CreateUsers: migrating ====================================================
-- create_table(:users)
   -> 0.0012s
==  CreateUsers: migrated (0.0013s) ===========================================

==  CreateAssignments: migrating ==============================================
-- create_table(:assignments)
   -> 0.0011s
==  CreateAssignments: migrated (0.0012s) =====================================
```

And as simple as that you should have a sqlite database file `testdb.sqlite` in your root directory.


