[
  {:id => 1, :name => "N/A"},
  {:id => 2, :name => "Grandfather"},
  {:id => 3, :name => "GrandMother"},
  {:id => 4, :name => "Father"},
  {:id => 5, :name => "Mother"},
  {:id => 6, :name => "Brother"},
  {:id => 7, :name => "Sister"},
  {:id => 8, :name => "Daughter"},
  {:id => 9, :name => "Son"},
  {:id => 10, :name => "Husband"},
  {:id => 11, :name => "Wife"}
].each do |relationship|
  Relationship.where(name: relationship[:name]).first_or_create
end
