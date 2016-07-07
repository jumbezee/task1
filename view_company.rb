require 'active_record'
require 'pg'
require 'minitest/autorun'

com = PG.connect :dbname => 'task', :user => 'nikolajkuzmenko'

com.exec "CREATE MATERIALIZED VIEW mvw_proofiles AS
SELECT profiles.id, companies.name || ' ' || companies.city || ' ' || companies.country AS companies_data, profiles.first_name
FROM profiles
INNER JOIN companies ON companies.id = profiles.companies_id;"

com.exec "EXPLAIN ANALYZE SELECT * FROM mvw_proofiles;"


# EXPLAIN ANALYZE SELECT * FROM mvw_proofiles WHERE companies_data = 'companies_3';


# INSERT INTO profiles ( companies_id, first_name ) VALUES
# ( 1, 'Потерянный во мгле' );