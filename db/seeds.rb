[
  {:id => 1, :name => "N/A"},
  {:id => 2, :name => "Preschool"},
  {:id => 3, :name => "Elementary school"},
  {:id => 4, :name => "High school"},
  {:id => 5, :name => "Tertiary education"},
  {:id => 6, :name => "Vocational education"},
  {:id => 7, :name => "Graduate education"},
  {:id => 8, :name => "Adult education"}
].each do |level|
  AcademicLevel.where(name: level[:name]).first_or_create
end
