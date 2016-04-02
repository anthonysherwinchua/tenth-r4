files = ['academic_levels', 'users', 'blood_types', 'citizenships', 'civil_statuses', 'contact_types', 'languages',
         'relationships', 'countries', 'documents', 'occupations', 'job_openings']

files.each do |file|
  if file.singularize.camelize.constantize.count < 1
    puts "File: #{file}"
    require Rails.root + "db/seeds/#{file}.rb"
  else
    puts "Skipping File: #{file}"
  end
end


files = ['user_roles']

files.each do |file|
  puts "File: #{file}"
  require Rails.root + "db/seeds/#{file}.rb"
  puts 'forced to seed'
end

