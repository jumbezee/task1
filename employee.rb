require 'active_record'
require 'pg'
require 'minitest/autorun'


class Employee < ActiveRecord::Base
   
    user = PG.connect :dbname => 'task', :user => 'nikolajkuzmenko'
    user.exec "DROP TABLE IF EXISTS Employes"
    user.exec "CREATE TABLE Employes(email varchar(80))"
end

class CreateEmployeeTable < ActiveRecord::Migration
  
  def self.changeUP
    create_table :employes do |t|
      t.string :email
    end
  end


end
