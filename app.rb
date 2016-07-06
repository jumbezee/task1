require 'active_record'
require 'open-uri'
require 'pg'
require 'minitest/autorun'
require 'byebug'

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  database: 'trgm',
  host: 'localhost',
  username: 'nikolajkuzmenko'
)

class Country < ActiveRecord::Base
  def self.similar(query)
    where('similarity(name, ?) > 0.3', query)
  end
end

class CreateCountryTable < ActiveRecord::Migration
  def self.up
    create_table :countries do |t|
      t.string :name
    end

    data = JSON.load open("http://api.vk.com/method/database.getCountries?v=5.34&need_all=1&count=234&lang=ru")
    data["response"]["items"].each do |country|
      Country.create!(name: country["title"])

    end

    enable_extension "pg_trgm"

    execute 'CREATE INDEX trgm_idx ON countries USING gist (name gist_trgm_ops);'
  end

  def self.down
    drop_table :countries
  end
end

CreateCountryTable.migrate(:up) unless ActiveRecord::Base.connection.table_exists? :countries

p "Country count: #{Country.name}"

Country.similar('Россия').each do |country|
  p country.name
end

describe Country do
  it 'находит страну по точному названию' do
    data = Country.similar 'Россия'
    assert_equal data.count, 1
    assert_equal data.first.name, 'Россия'
  end

  it 'находит страну с ошибкой в названии' do
    data = Country.similar 'Росия'
    assert_equal data.count, 1
    assert_equal data.first.name, 'Россия'
  end
end