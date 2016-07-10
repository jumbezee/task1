require 'active_record'
require 'pg'


class AddColumn

  def adding_locale
    @com = PG.connect :dbname => 'task', :user => 'nikolajkuzmenko'

    # com.exec "ALTER table IF EXISTS profiles drop column locale"


    # @com.exec "ALTER table profiles add column locale varchar(80)"

   @com.exec "DO $$ 
                  BEGIN
                      BEGIN
                          ALTER TABLE profiles ADD COLUMN locale varchar(80);
                      EXCEPTION
                          WHEN duplicate_column THEN RAISE NOTICE 'column locale already exists in profiles.';
                      END;
                  END;
              $$"


  end

  def filling_locale
    @com.exec "UPDATE profiles 
    SET locale = ( SELECT LEFT (country, 2) 
    FROM companies 
    WHERE companies.id = profiles.company_id 
    ORDER BY profiles.id)"
  end
end
a = AddColumn.new
a.adding_locale
a.filling_locale
