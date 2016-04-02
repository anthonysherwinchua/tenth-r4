[
  {:id => 1, :name => "N/A"},
  {:id => 2, :name => "Mobile Number"},
  {:id => 3, :name => "Home Phone Number"},
  {:id => 4, :name => "Office Phone Number"},
  {:id => 5, :name => "Fax Number"},
  {:id => 6, :name => "Web Address"},
  {:id => 7, :name => "Email Address"},
  {:id => 8, :name => "Postal Address"}
].each do |contact_type|
  ContactType.where(name: contact_type[:name]).first_or_create
end
