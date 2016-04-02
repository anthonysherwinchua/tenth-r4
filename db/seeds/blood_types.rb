[
  {:id => 1, :name => "N/A"},
  {:id => 2, :name => "O-"},
  {:id => 3, :name => "O+"},
  {:id => 4, :name => "A-"},
  {:id => 5, :name => "A+"},
  {:id => 6, :name => "B-"},
  {:id => 7, :name => "B+"},
  {:id => 8, :name => "AB-"},
  {:id => 9, :name => "AB+"}
].each do |blood_type|
  BloodType.where(name: blood_type[:name]).first_or_create
end
