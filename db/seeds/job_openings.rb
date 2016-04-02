[
  {"country_id"=>89, "enabled"=>true, "id"=>1, "occupation_id"=>2, "template"=>2},
  {"country_id"=>197, "enabled"=>true, "id"=>2, "occupation_id"=>8, "template"=>2},
  {"country_id"=>197, "enabled"=>true, "id"=>4, "occupation_id"=>3, "template"=>2},
  {"country_id"=>182, "enabled"=>true, "id"=>5, "occupation_id"=>2, "template"=>2}
].each do |job_opening|
  JobOpening.where(country_id: job_opening['country_id'], occupation_id: job_opening['occupation_id']).first_or_create(job_opening)
end
