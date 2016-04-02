[
  {:id => 1, :name => "Filipino", :enabled => true }
].each do |citizenship|
  Citizenship.where(name: citizenship[:name]).first_or_create(citizenship)
end
