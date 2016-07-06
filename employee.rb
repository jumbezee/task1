require 'active_record'
require 'pg'
require 'minitest/autorun'


class Employee < ActiveRecord::Base
   
    user = PG.connect :dbname => 'task', :user => 'nikolajkuzmenko'
    user.exec "DROP TABLE IF EXISTS Employees CASCADE"
    user.exec "CREATE TABLE Employees(email varchar(80))"
end

class CreateEmployeeTable < ActiveRecord::Migration
  
  def self.changeE
    create_table :employees do |t|
      t.string :email
    end
  end


end
