require 'active_record'
require 'pg'
require 'minitest/autorun'



ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  database: 'task',
  host: 'localhost',
  username: 'nikolajkuzmenko'
)

class Company < ActiveRecord::Base
    has_many :profiles
    com = PG.connect :dbname => 'task', :user => 'nikolajkuzmenko'
    begin
    com.exec "DROP TABLE IF EXISTS Companies CASCADE"
    com.exec "CREATE TABLE Companies(id serial NOT NULL,
    name VARCHAR(80), 
    city VARCHAR(80), 
    country VARCHAR(80), 

    CONSTRAINT pk_companies_id PRIMARY KEY ( id ),
    CONSTRAINT uk_companies_name UNIQUE (name) )"
    end

   load 'userprofile.rb'


end

class CreateCompanyTable < ActiveRecord::Migration
  
  def self.change
    create_table :companies do |t|
      t.string :name
      t.string :city
      t.string :country
    end
  end
  load 'add_to_db.rb' # add_to_db.rb - automatically , add_to_db_manually.rb - manually
  load 'add_column_locale.rb'
end




CreateCompanyTable.migrate(:change) unless ActiveRecord::Base.connection.table_exists? :companies
CreateProfileTable.migrate(:changeUP) unless ActiveRecord::Base.connection.table_exists? :profiles
CreateEmployeeTable.migrate(:changeE) unless ActiveRecord::Base.connection.table_exists? :employees