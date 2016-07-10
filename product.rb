require 'active_record'
require 'pg'
require 'minitest/autorun'


class Product < ActiveRecord::Base
    belongs_to :companies
    prod = PG.connect :dbname => 'task', :user => 'nikolajkuzmenko'

    prod.exec "DROP TABLE IF EXISTS Products CASCADE"

    prod.exec "CREATE TABLE Products(id serial NOT NULL,
                company_id integer NOT NULL,
                title varchar(80),
                path_to_image text,
                description varchar(250),
                price integer,
                
                CONSTRAINT pk_products PRIMARY KEY ( id ),
                CONSTRAINT fk_products_company FOREIGN KEY (company_id) REFERENCES companies (id),
                CONSTRAINT uk_products_name UNIQUE ( company_id, title, description) 
                )"
end

class CreateProductTable < ActiveRecord::Migration
  
  def self.changePr
    create_table :products do |t|
      t.string :title
      t.string :path_to_image
      t.string :description
      t.int :price
    end
  end
end
