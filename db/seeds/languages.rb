[
  {:id => 1, :name => "English", :enabled => true },
  {:id => 2, :name => "Mandarin", :enabled => true }
].each do |language|
  Language.where(name: language[:name]).first_or_create
end
