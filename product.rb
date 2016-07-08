require 'active_record'
require 'pg'
require 'minitest/autorun'


class Product < ActiveRecord::Base
   
    user = PG.connect :dbname => 'task', :user => 'nikolajkuzmenko'
    user.exec "DROP TABLE IF EXISTS Products CASCADE"
    user.exec "CREATE TABLE Products(id serial NOT NULL,
                companies_id integer NOT NULL,
                title varchar(80),
                path_to_image varchar(250),
                description varchar(250),
                
                CONSTRAINT pk_products_id PRIMARY KEY ( id ),
                CONSTRAINT fk_products_companies_id FOREIGN KEY (companies_id) REFERENCES companies (id),
                CONSTRAINT uk_products_name UNIQUE ( companies_id, title, description) 
                )"
end

class CreateProductTable < ActiveRecord::Migration
  
  def self.changeE
    create_table :products do |t|
      t.string :title
      t.string :path_to_image
      t.string :description
    end
  end


end
