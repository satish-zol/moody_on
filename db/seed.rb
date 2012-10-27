puts "Creating admin" 

puts 'CREATING ROLES'
Role.create([
  { :name => 'admin' }, 
  { :name => 'user' }
], :without_protection => true)

puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :name => 'Admin', :email => 'user@example.com', :password => 'please123', :password_confirmation => 'please123'
puts 'New user created: ' << user.name

user.add_role :admin

