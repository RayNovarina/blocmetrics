puts "Seeding database:\n"
puts 'Seeding Users, RegisteredApplications, Events'

# Create Users
5.times do
  User.create!(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: 'password'
  )
end
# Create an admin user
admin_user = User.create!(
  name:     'Admin User',
  email:    'admin@example.com',
  password: 'password'
# role:     :admin
)

# Create a member user
member_user = User.create!(
  name:     'Member User',
  email:    'member@example.com',
  password: 'password'
# role:     :member
)

# Create a Member user with a valid email address/gravatar
test_user = User.create!(
  name:     'Test User',
  email:    'RNova94037@Gmail.com',
  password: 'password'
# role:     :member
)
users = User.all

# Create RegisteredApplications 10
puts 'Seeding RegisteredApplications'
10.times do
  RegisteredApplication.create!(
    user:   users.sample,
    name:   Faker::Company.name,
    url:    Faker::Internet.url
  )
end
registered_applications = RegisteredApplication.all

# Create Events 50
puts "\n\n*************** seeding Events ****************"
500.times do
  event = Event.create!(
    registered_application:  registered_applications.sample,
    name:  Faker::SlackEmoji.activity
  )
  event.update_attribute(:created_at, rand(10.minutes..1.year).ago)
end

puts 'Seed finished'
puts "#{User.count} users created"
puts "'Test user' (credentials):   '#{test_user.name}' (#{test_user.email}/#{test_user.password})"
puts "'Admin user' (credentials):  '#{admin_user.name}' (#{admin_user.email}/#{admin_user.password})"
puts "'Member user' (credentials): '#{member_user.name}' (#{member_user.email}/#{member_user.password})"
puts "#{RegisteredApplication.count} RegisteredApplications created"
puts "#{Event.count} Events created"
