puts "Cleaning database!"
User.destroy_all
Challenge.destroy_all
Invite.destroy_all

puts "Creating users.."

User.create!(
  email: "lus@gmail.com",
  password: "123456",
  nickname: "luciamndzz"
)
User.create!(
  email: "xtremo@gmail.com",
  password: "123456",
  nickname: "tomasxtrmo"
)
User.create!(
  email: "magikmaikk@gmail.com",
  password: "123456",
  nickname: "maikmagikk"
)
User.create!(
  email: "camilo@gmail.com",
  password: "123456",
  nickname: "camilost"
)
User.create!(
  email: "sofia@gmail.com",
  password: "123456",
  nickname: "sofb"
)
User.create!(
  email: "enrique@gmail.com",
  password: "123456",
  nickname: "enriquemtz"
)
User.create!(
  email: "ceci@gmail.com",
  password: "123456",
  nickname: "cecigalv"
)

puts "Creating Challenges"

Challenge.create!(
  name: "BUDDIES CHALLENGE!",
  challenge_type: "Public",
  activity: "Open",
  status: "created",
<<<<<<< home
  start_date: "2024-06-30",
  end_date: "2024-07-30",
  user_id: 1
=======
  user_id: 1,
  start_date: "2024-08-15",
  end_date: "2024-09-15"
>>>>>>> master
)
Challenge.create!(
  name: "SURFERS CHALLENGE",
  challenge_type: "Public",
  activity: "Open",
  status: "created",
  start_date: "2024-10-01",
  end_date: "2024-11-01",
  user_id: 1
)
Challenge.create!(
  name: "TEC NOMADS OPEN CHALLENGE",
  challenge_type: "Private",
  activity: "Open",
  status: "created",
<<<<<<< home
  start_date: "2024-07-10",
  end_date: "2024-08-20",
  user_id: 1
)
Challenge.create!(
  name: "BATCH 1686 FIT CHALLENGE",
  challenge_type: "Private",
  activity: "Open",
  status: "created",
  start_date: "2024-07-09",
  end_date: "2024-08-30",
  user_id: 1
=======
  user_id: 1,
  start_date: "2024-09-22",
  end_date: "2024-10-15"
>>>>>>> master
)

# require "open-uri"

# url = "https://www.verywellfit.com/thmb/LfYZrMFhy9xIOPrvf0UAiZupQ2E=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/barre-workout-plie-squat-574378583df78c6bb0220c8f.jpg"
# file = URI.open(url)


puts "Creating a challenge info for BUDDIES CHALLENGE"

ChallengeInfo.create!(
  user_score: 1,
  attendance: false,
  user_id: 1,
  challenge_id: 1,
  user_status: "active"
)

ChallengeInfo.create!(
  user_score: 1,
  attendance: false,
  user_id: 2,
  challenge_id: 1,
  user_status: "active"
)

ChallengeInfo.create!(
  user_score: 1,
  attendance: false,
  user_id: 3,
  challenge_id: 1,
  user_status: "active"
)

puts "Creating a challenge info for BATCH 1686 FIT CHALLENGE"

ChallengeInfo.create!(
  user_score: 0,
  attendance: false,
  user_id: 1,
  challenge_id: 4,
  user_status: "active"
)

ChallengeInfo.create!(
  user_score: 0,
  attendance: false,
  user_id: 2,
  challenge_id: 4,
  user_status: "active"
)

ChallengeInfo.create!(
  user_score: 0,
  attendance: false,
  user_id: 3,
  challenge_id: 4,
  user_status: "active"
)

ChallengeInfo.create!(
  user_score: 0,
  attendance: false,
  user_id: 4,
  challenge_id: 4,
  user_status: "active"
)

ChallengeInfo.create!(
  user_score: 0,
  attendance: false,
  user_id: 5,
  challenge_id: 4,
  user_status: "active"
)

ChallengeInfo.create!(
  user_score: 0,
  attendance: false,
  user_id: 6,
  challenge_id: 4,
  user_status: "active"
)

ChallengeInfo.create!(
  user_score: 0,
  attendance: false,
  user_id: 7,
  challenge_id: 4,
  user_status: "active"
)

puts "Creating exercise sesions for BUDDIES CHALLENGE"

exercise = ExerciseSession.create!(
  activity: "Swimming",
  time_length: 1,
  description: "test",
  like: 1,
  challenge_info_id: 1
)

puts "Creating exercise sesions for BATCH 1686 FIT CHALLENGE"

ExerciseSession.create!(
  activity: "Gym",
  time_length: 60,
  description: "Cumpliendooo",
  like: 1,
  challenge_info_id: 2
)

ExerciseSession.create!(
  activity: "Pilates",
  time_length: 60,
  description: "Estuvo duro pero se logró",
  like: 1,
  challenge_info_id: 5
)

ExerciseSession.create!(
  activity: "Box",
  time_length: 60,
  description: "Empecé clases de box! A ver cómo me va!",
  like: 1,
  challenge_info_id: 6
)

puts "Creating a comment..."

ExerciseComment.create!(
  comments: "Está hermoso tu perro!",
  exercise_session_id: 1
)
ExerciseComment.create!(
  comments: "Deli! A mi me toca el miércoles!",
  exercise_session_id: 2
)

puts "Creating an invite!!!"

Invite.create!(
  status: "Pending",
  invitee_id: 2,
  inviter_id: 1,
  challenge_id: 1
)

puts "Finishing :)"
