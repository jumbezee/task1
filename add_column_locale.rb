require 'active_record'
require 'pg'
require 'minitest/autorun'


user = PG.connect :dbname => 'task', :user => 'nikolajkuzmenko'





a = user.exec "EXPLAIN ANALYZE SELECT country FROM companies;"

puts "======================================="
puts a
puts "======================================="


