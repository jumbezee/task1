require 'minitest/autorun'
require './add_column_locale'
require 'pg'





describe AddColumn do
      us = PG.connect :dbname => 'task', :user => 'nikolajkuzmenko'
      before do
        @addc = AddColumn.new
      end
      

      @arrp = []
      @arrc = []

      it 'finding locale' do
        us.exec "copy profiles(locale) TO '/Users/nikolajkuzmenko/ProjectRoR/task1/locale.txt';"
        us.exec "copy (SELECT LEFT (country, 2) FROM companies) TO '/Users/nikolajkuzmenko/ProjectRoR/task1/file.txt';"

        p = File.new('locale.txt','r')
        c = File.new('file.txt','r')

        p.each_line do |line|
          @arrp = line
        end
        c.each_line do |line|
          @arrc = line
        end

        @arrp[1].must_equal @arrc[1]

      end

end