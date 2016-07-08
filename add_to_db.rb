  # 10.times do |i|
  #     i += 1
  #     name = "company_" + i.to_s
  #     city = "city_" + i.to_s
  #     country = "country_" + i.to_s
  #     Company.create!(name: name, city: city, country: country)

  #     10.times do |i|
  #         i += 1
  #         first = "first_name_" + i.to_s
  #         last = "last_name_" + i.to_s
  #         g = rand(1..2)
  #         case g
  #           when 1
  #             gender = 'male'
  #           when 2
  #             gender = 'femail'
  #         end 
  #         Profile.create!(name: name, first_name: first, last_name: last, gender: gender)
  #       end   
  #   end

com = PG.connect :dbname => 'task', :user => 'nikolajkuzmenko'



  com.exec "INSERT INTO companies (name, city, country ) VALUES
  ( 
  'company_'|| generate_series(1, 1000) ||'',
  'city_' || generate_series ( 1, 1000 ) || '',
  'country_' || generate_series ( 1, 1000 ) || '' 
  );"


1000.times do |j|   
j += 1
    100.times do |i|
              i += 1
              first = "first_name_" + i.to_s
              last = "last_name_" + i.to_s
              title = "title_" + i.to_s
              description = "description_" + i.to_s
              path = "url/blabla"
              g = rand(1..2)
                case g
                  when 1
                    gender = 'male'
                  when 2
                    gender = 'femail'
                end 
              Profile.create!(companies_id: j, first_name: first, last_name: last, gender: gender)
              Product.create!(companies_id: j, title: title, path_to_image: path, description: description)
    end   
end

