id = 1
# idp = 1
loop do
      print "Введите название компании: "
      name = gets.strip
      
      print "Введите название города, в котором расположена компания: "
      city = gets.strip
      
      print "Укажите страну: "
      country = gets.strip

      # puts "#{name}, #{city}, #{country}"
      Company.create!(name: name, city: city, country: country)
      
      print "Хотите добавить сотрудников?(Y/N)"
      fl = gets.strip.capitalize
      
      if fl == "Y"
        loop do
            print "Введите имя: "
            first = gets.strip
            
            print "Введите фамилию: "
            last = gets.strip

            print "Добавьте email: "
            email = gets.strip
            

            print "Укажите пол(M/F): "
            g = gets.strip.capitalize
                    loop do
                        if g == "M"
                          @gender = "male"
                          break
                        elsif g == "F"
                          @gender = "female"
                          break
                        else 
                          puts "Вы совершили ошибку!Укажите пол снова!(M/F): "
                          g = gets.strip.capitalize
                        end
                    end

             # puts "this blok is OK"  
            # Employee.create!(profiles_id: idp, email: email)    
            # idp += 1
            Profile.create!(companies_id: id,email: email, first_name: first, last_name: last, gender: @gender)
            
            print "Хотите добавить сотрудников?(Y/N): "
            fll = gets.strip.capitalize

            if fll == "N"
              break
            end

        end 
      end
      print "Хотите добавить компанию?(Y/N)"
      flll = gets.strip.capitalize

      if flll == "N"
        load 'add_column_locale.rb'
        exit

      end
id += 1
end