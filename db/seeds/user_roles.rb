u = User.find_by username: 'alfonso'
u.add_role :admin

u = User.find_by username: 'anthony'
u.add_role :admin

u = User.find_by username: 'encoder'
u.add_role :encoder
