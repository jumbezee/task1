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

    com = PG.connect :dbname => 'task', :user => 'nikolajkuzmenko'
    begin
    com.exec "DROP TABLE IF EXISTS Companies CASCADE"
    com.exec "CREATE TABLE Companies(name VARCHAR(80) primary key, 
        city VARCHAR(80), country VARCHAR(80) )"
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
  load 'add_to_db_manually.rb'
end




CreateCompanyTable.migrate(:change) unless ActiveRecord::Base.connection.table_exists? :company
CreateProfileTable.migrate(:changeUP) unless ActiveRecord::Base.connection.table_exists? :profiles
CreateEmployeeTable.migrate(:changeE) unless ActiveRecord::Base.connection.table_exists? :employees