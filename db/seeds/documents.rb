[
  {"enabled"=>true, "id"=>1, "name"=>"N/A"},
  {"enabled"=>true, "id"=>2, "name"=>"Passport"},
  {"enabled"=>true, "id"=>3, "name"=>"NBI"},
  {"enabled"=>true, "id"=>4, "name"=>"Medical"},
  {"enabled"=>true, "id"=>5, "name"=>"Marriage Certificate"},
  {"enabled"=>true, "id"=>6, "name"=>"VISA"},
  {"enabled"=>true, "id"=>7, "name"=>"Drug Test"},
  {"enabled"=>true, "id"=>8, "name"=>"Birth Certificate"},
  {"enabled"=>true, "id"=>9, "name"=>"Driver's License"}
].each do |document|
  Document.where(name: document['name']).first_or_create(document)
end
