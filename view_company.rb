require 'active_record'
require 'pg'
require 'minitest/autorun'

com = PG.connect :dbname => 'task', :user => 'nikolajkuzmenko'

# com.exec "ALTER table profiles add column locale varchar(80)"
com.exec "COPY companies(country) TO '/Users/nikolajkuzmenko/ProjectRoR/task1/file.txt' "
          


puts "======================"

puts "======================"

# EXPLAIN ANALYZE SELECT * FROM mvw_proofiles WHERE companies_data = 'companies_3';


# INSERT INTO profiles ( companies_id, first_name ) VALUES
# ( 1, 'Потерянный во мгле' );