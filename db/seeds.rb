puts "Cleaning database!"
User.destroy_all
Challenge.destroy_all
Invite.destroy_all

puts "Creating users.."

User.create!(
  email: "lu@gmail.com",
  password: "123456",
  nickname: "luciamndz"
)
User.create!(
  email: "xtrem@gmail.com",
  password: "123456",
  nickname: "tomasxtrm"
)
User.create!(
  email: "magikmaik@gmail.com",
  password: "123456",
  nickname: "maikmagik"
)

puts "Creating Challenges"

Challenge.create!(
  name: "SET UP CHALLENGE",
  duration: 7,
  challenge_type: "public",
  activity: "open",
  status: "created",
  user_id: 1
)
Challenge.create!(
  name: "ANOTHER CHALLENGE",
  duration: 7,
  challenge_type: "private",
  activity: "open",
  status: "created",
  user_id: 1
)

# require "open-uri"

# url = "https://www.verywellfit.com/thmb/LfYZrMFhy9xIOPrvf0UAiZupQ2E=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/barre-workout-plie-squat-574378583df78c6bb0220c8f.jpg"
# file = URI.open(url)


puts "Creating a challenge info..."

ChallengeInfo.create!(
  user_score: 1,
  attendance: false,
  user_id: 1,
  challenge_id: 1
)

puts "Creating exercise sesions..."

exercise = ExerciseSession.create!(
  activity: "swimming",
  time_length: 1,
  description: "test",
  like: 1,
  challenge_info_id: 1
)

puts "Creating a comment..."

ExerciseComment.create!(
  comments: "This is going well..",
  exercise_session_id: 1
)
ExerciseComment.create!(
  comments: "Or not",
  exercise_session_id: 1
)

puts "Creating an invite!!!"

Invite.create!(
  status: "pending",
  user_id: 2,
  challenge_id: 1
)

puts "Finishing :)"
