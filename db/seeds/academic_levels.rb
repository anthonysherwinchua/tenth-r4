[
  {:id => 1, :name => "N/A"},
  {:id => 2, :name => "Preschool"},
  {:id => 3, :name => "Elementary school undergraduate"},
  {:id => 4, :name => "High school undergraduate"},
  {:id => 5, :name => "Tertiary education undergraduate"},
  {:id => 6, :name => "Vocational education undergraduate"},
  {:id => 7, :name => "Graduate education"},
  {:id => 8, :name => "Elementary graduate"},
  {:id => 9, :name => "High school graduate"},
  {:id => 10, :name => "Tertiary education graduate"},
  {:id => 11, :name => "Vocational education graduate"},
].each do |level|
  AcademicLevel.where(name: level[:name]).first_or_create
end
