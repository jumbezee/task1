require 'active_record'
require 'pg'
require 'minitest/autorun'
require './user_profile'



ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  database: 'task',
  host: 'localhost',
  username: 'nikolajkuzmenko'
)

class Company < ActiveRecord::Base
  com = PG.connect :dbname => 'task', :user => 'nikolajkuzmenko'
    
    com.exec "DROP TABLE IF EXISTS Companies"
    com.exec "CREATE TABLE Companies(name VARCHAR(80), 
        city VARCHAR(80), country VARCHAR(80) )"
end


class CreateCompanyTable < ActiveRecord::Migration
  
  def self.change
    create_table :companies do |t|
      t.string :name
      t.string :city
      t.string :country
    end
  end
  

    

    1000.times do |i|
      i += 1
      name = "company_" + i.to_s
      city = "city_" + i.to_s
      country = "country_" + i.to_s
    Company.create!(name: name, city: city, country: country)
      100.times do |i|
        first = "first" + i.to_s
        UserProfile.create!()
      end

    end

 





end


CreateCompanyTable.migrate(:change) unless ActiveRecord::Base.connection.table_exists? :companies

CreateUserProfileTable.migrate(:changeUP) unless ActiveRecord::Base.connection.table_exists? :users_profiles