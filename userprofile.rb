require 'active_record'
require 'pg'
require 'minitest/autorun'


class Profile < ActiveRecord::Base
    belongs_to :companies
    load 'employee.rb'
    user = PG.connect :dbname => 'task', :user => 'nikolajkuzmenko'

    user.exec "ALTER table if exists profiles drop column locale"
    user.exec "DROP TABLE IF EXISTS Profiles CASCADE"

    user.exec "CREATE TABLE Profiles(id serial NOT NULL,
                company_id integer NOT NULL, 
                first_name VARCHAR(80), 
                last_name VARCHAR(80), 
                gender VARCHAR(8),

                CONSTRAINT pk_profiles PRIMARY KEY ( id ),
                CONSTRAINT fk_profiles_company FOREIGN KEY (company_id) REFERENCES companies (id),
                CONSTRAINT uk_profiles_name UNIQUE ( company_id, first_name, last_name ) 
                ) INHERITS (employees)"
    

end

class CreateProfileTable < ActiveRecord::Migration
  
  def self.changeUP
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
    end
  end
end

