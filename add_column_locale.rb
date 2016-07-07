require 'active_record'
require 'pg'
require 'minitest/autorun'

com = PG.connect :dbname => 'task', :user => 'nikolajkuzmenko'

# com.exec "ALTER table IF EXISTS profiles drop column locale"





com.exec "ALTER table profiles add column locale varchar(80)"

com.exec "UPDATE profiles 
SET locale = ( SELECT LEFT (country, 2) 
FROM companies 
WHERE companies.id = profiles.companies_id 
ORDER BY profiles.id)"


