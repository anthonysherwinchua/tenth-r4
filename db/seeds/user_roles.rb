u = User.find_by_usernmae 'alfonso'
u.add_role :admin

u = User.find_by_usernmae 'anthony'
u.add_role :admin

u = User.find_by_usernmae 'encoder'
u.add_role :encoder
