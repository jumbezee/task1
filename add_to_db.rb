  10.times do |i|
      i += 1
      name = "company_" + i.to_s
      city = "city_" + i.to_s
      country = "country_" + i.to_s
      Company.create!(name: name, city: city, country: country)

      10.times do |i|
          i += 1
          first = "first_name_" + i.to_s
          last = "last_name_" + i.to_s
          g = rand(1..2)
          case g
            when 1
              gender = 'male'
            when 2
              gender = 'femail'
          end 
          Profile.create!(name: name, first_name: first, last_name: last, gender: gender)
        end   
    end
