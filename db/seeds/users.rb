[
  { email: 'alfonso@10thstory.com', username: 'alfonso', name: 'Alfonso', password: 'password123' },
  { email: 'anthonysherwinchua@gmail.com', username: 'anthony', name: 'Anthony', password: 'password123' },
  { email: 'encoder@10thstory.com', username: 'encoder', name: 'encoder', password: 'password123' }
].each do |user|
  User.where(email: user[:email]).first_or_create(user)
end
