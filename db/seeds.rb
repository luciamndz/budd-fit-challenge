puts "Cleaning database!"
User.destroy_all
Challenge.destroy_all
Invite.destroy_all

puts "Creating users.."

User.create!(
  email: "lu@gmail.com",
  password: "123456",
  user_name: "luciamndz"
)
User.create!(
  email: "xtrem@gmail.com",
  password: "123456",
  user_name: "tomasxtrm"
)
User.create!(
  email: "magikmaik@gmail.com",
  password: "123456",
  user_name: "maikmagik"
)

puts "Creating Challenges"


