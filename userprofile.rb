require 'active_record'
require 'pg'
require 'minitest/autorun'


class Profile < ActiveRecord::Base
    belongs_to :companies
    load 'employee.rb'
    user = PG.connect :dbname => 'task', :user => 'nikolajkuzmenko'
    user.exec "DROP TABLE IF EXISTS Profiles CASCADE"
    user.exec "CREATE TABLE Profiles(id serial NOT NULL,
                companies_id integer NOT NULL, 
                first_name VARCHAR(80), 
                last_name VARCHAR(80), 
                gender VARCHAR(8),

                CONSTRAINT pk_profiles_id PRIMARY KEY ( id ),
                CONSTRAINT fk_profiles_companies_id FOREIGN KEY (companies_id) REFERENCES companies (id),
                CONSTRAINT uk_profiles_name UNIQUE ( companies_id, first_name, last_name ) 
                ) INHERITS (employees)"
    load 'add_column_locale.rb'
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

