[
  {:id => 1, :name => "N/A", :enabled => "true"},
  {:id => 2, :name => "Single", :enabled => "true"},
  {:id => 3, :name => "Married", :enabled => "true"},
  {:id => 4, :name => "Separated", :enabled => "true"},
  {:id => 5, :name => "Divorced", :enabled => "true"},
  {:id => 6, :name => "Widowed", :enabled => "true"}
].each do |civil_status|
  CivilStatus.where(name: civil_status[:name]).first_or_create(civil_status)
end
