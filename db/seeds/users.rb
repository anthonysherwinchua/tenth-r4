[
  {"created_at"=>'Sat, 14 Jul 2012 17:30:34 UTC +00:00', "email"=>"admin@10thstory.com", "first_name"=>"", "id"=>1, "last_name"=>"", "middle_name"=>"", "updated_at"=>'Sat, 02 Apr 2016 01:01:40 UTC +00:00', "username"=>""},
  {"created_at"=>'Sun, 28 Jul 2013 11:17:04 UTC +00:00', "email"=>"anthonysherwinchua@gmail.com", "first_name"=>"", "id"=>2, "last_name"=>"", "middle_name"=>"", "updated_at"=>'Sat, 02 Apr 2016 02:47:09 UTC +00:00', "username"=>nil}
].each do |user|
  User.where(email: user['email']).first_or_create(password: 'password123')
end
