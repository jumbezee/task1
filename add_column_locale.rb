require 'active_record'
require 'pg'
require 'minitest/autorun'

@com = PG.connect :dbname => 'task', :user => 'nikolajkuzmenko'

# com.exec "ALTER table IF EXISTS profiles drop column locale"

# @com.exec "ALTER table profiles add column locale varchar(80)"

@com.exec "UPDATE profiles SET locale = ( SELECT country FROM companies WHERE companies.id = profiles.companies_id)"



# def create_array
#   f = File.new('file.txt','r')
#   a = ''
#   @arr = []
#   f.each_line do |line|
#     @arr = line[0, 2]
#     puts @arr.inspect
#     # @com.exec "COPY profiles(locale) FROM #{@arr}"
   
#   end
# end
          


# create_array

