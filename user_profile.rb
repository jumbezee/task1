require 'active_record'
require 'pg'
require 'minitest/autorun'

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  database: 'task',
  host: 'localhost',
  username: 'nikolajkuzmenko'
)

class UserProfile < ActiveRecord::Base
  com = PG.connect :dbname => 'task', :user => 'nikolajkuzmenko'
    
    com.exec "DROP TABLE IF EXISTS User_profile"
    com.exec "CREATE TABLE User_profile(first_name VARCHAR(80), 
        last_name VARCHAR(80), gender VARCHAR(4) )"
end


class CreateUserProfileTable < ActiveRecord::Migration
  
  def self.changeUP
    create_table :users_profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
    end
  end
  

end

