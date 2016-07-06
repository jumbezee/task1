require 'active_record'
require 'pg'
require 'minitest/autorun'


class Profile < ActiveRecord::Base
    load 'employee.rb'
    user = PG.connect :dbname => 'task', :user => 'nikolajkuzmenko'
    user.exec "DROP TABLE IF EXISTS Profiles CASCADE"
    user.exec "CREATE TABLE Profiles(name varchar(80) REFERENCES companies, first_name VARCHAR(80), 
        last_name VARCHAR(80), gender VARCHAR(8))INHERITS (employees)"
end

class CreateProfileTable < ActiveRecord::Migration
  
  def self.changeUP
    create_table :profiles do |t|
      t.string :name
      t.string :first_name
      t.string :last_name
      t.string :gender
    end
  end
end

