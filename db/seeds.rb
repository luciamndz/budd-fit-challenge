puts "Cleaning database!"
ExerciseComment.destroy_all
ExerciseSession.destroy_all
Invite.destroy_all
ChallengeInfo.destroy_all
Challenge.destroy_all
User.destroy_all


puts "Creating users.."

require 'open-uri'

users = [
  {email: "lucia@gmail.com", password: "123456", nickname: "luciamndzm", url: "https://avatars.githubusercontent.com/u/168779994?v=4"},
  {email: "xtremo@gmail.com", password: "123456", nickname: "tomasxtrmo", url: "https://avatars.githubusercontent.com/u/169010849?v=4"},
  {email: "magikmaikk@gmail.com", password: "123456", nickname: "maikmagikk", url: "https://avatars.githubusercontent.com/u/166572500?v=4"},
  {email: "camilo@gmail.com", password: "123456", nickname: "camilost", url: "https://media.istockphoto.com/id/1690733685/es/v%C3%ADdeo/retrato-de-cabeza-feliz-hombre-hispano-guapo.jpg?s=640x640&k=20&c=3V2ex2y88SRJAqm01O0oiwfb0M4uTeaDS8PEDvN95Kw="},
  {email: "sofia@gmail.com", password: "123456", nickname: "sofb", url: "https://media.istockphoto.com/id/508182206/es/foto/acercamiento-de-un-sonriente-joven-mujer-negra.jpg?s=612x612&w=0&k=20&c=Ih-UCCiq5J6nNYs-h5doWbogSJD3OdKGQz-iHemLxFE="},
  {email: "enrique@gmail.com", password: "123456", nickname: "enriquemtz", url: "https://us.123rf.com/450wm/lightfieldstudios/lightfieldstudios2006/lightfieldstudios200602210/148972259-hombre-guapo-sonriendo-mientras-mira-a-la-c%C3%A1mara-aislada-en-gris.jpg?ver=6"},
  {email: "ceci@gmail.com", password: "123456", nickname: "cecigalv", url: "https://st2.depositphotos.com/1007712/11394/i/450/depositphotos_113940510-stock-photo-portrait-of-happy-woman.jpg"}
]

users.each do |user|
  new_user = User.new(email: user[:email], password: user[:password], nickname: user[:nickname])
  file = URI.open(user[:url])
  new_user.photo.attach(io: file, filename: user[:nickname], content_type: "image/png")
  new_user.save
end

puts "Creating Challenges"

Challenge.create!(
  name: "BUDDIES CHALLENGE!",
  challenge_type: "Public",
  activity: "Open",
  status: "created",
  user_id: 1,
  start_date: "2024-07-01",
  end_date: "2024-08-15"
)
# Challenge.create!(
#   name: "SURFERS CHALLENGE",
#   challenge_type: "Public",
#   activity: "Open",
#   status: "created",
#   start_date: "2024-07-01",
#   end_date: "2024-08-01",
#   user_id: 1
# )

Challenge.create!(
  name: "BATCH 1686 FIT CHALLENGE",
  challenge_type: "Private",
  activity: "Open",
  status: "created",
  user_id: 1,
  start_date: "2024-07-01",
  end_date: "2024-08-15"
)

puts "Creating a challenge info for BUDDIES CHALLENGE"

ChallengeInfo.create!(
  user_score: 0,
  attendance: false,
  user_id: 1,
  challenge_id: 1,
  user_status: "active"
)

ChallengeInfo.create!(
  user_score: 0,
  attendance: false,
  user_id: 2,
  challenge_id: 1,
  user_status: "active"
)

ChallengeInfo.create!(
  user_score: 0,
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
  challenge_id: 3,
  user_status: "active"
)

ChallengeInfo.create!(
  user_score: 0,
  attendance: false,
  user_id: 2,
  challenge_id: 3,
  user_status: "active"
)

ChallengeInfo.create!(
  user_score: 0,
  attendance: false,
  user_id: 3,
  challenge_id: 3,
  user_status: "active"
)

ChallengeInfo.create!(
  user_score: 0,
  attendance: false,
  user_id: 4,
  challenge_id: 3,
  user_status: "active"
)

ChallengeInfo.create!(
  user_score: 0,
  attendance: false,
  user_id: 5,
  challenge_id: 3,
  user_status: "active"
)

ChallengeInfo.create!(
  user_score: 0,
  attendance: false,
  user_id: 6,
  challenge_id: 3,
  user_status: "active"
)

ChallengeInfo.create!(
  user_score: 0,
  attendance: false,
  user_id: 7,
  challenge_id: 3,
  user_status: "active"
)

# puts "Creating exercise sesions for BATCH 1686 FIT CHALLENGE"

# require 'open-uri'
# exercise_sessions = [
#   {activity: "Gym", time_length: 60, description: "Cumpliendooo", like: 1, challenge_info_id: 2, evidence: "https://editorialtelevisa.brightspotcdn.com/dims4/default/f61b2f9/2147483647/strip/false/crop/1200x672+0+0/resize/1200x672!/quality/90/?url=https%3A%2F%2Fk2-prod-editorial-televisa.s3.us-east-1.amazonaws.com%2Fbrightspot%2Fc1%2Fa5%2F545c7085455fb49eff7340aa91c8%2Fpersonas-publican-selfies-en-el-gym-tienen-proeblemas-psicologicos.jpg"},
#   {activity: "Pilates", time_length: 60, description: "Estuvo duro pero se logró", like: 1, challenge_info_id: 5, evidence: "https://media.istockphoto.com/id/1336608944/es/foto/hombre-musculoso-en-forma-haciendo-un-ejercicio-de-pilates-teaser-en-un-reformador.jpg?s=612x612&w=0&k=20&c=HxQSVoPeAQ5aU6TlrTTsE8RekEFX_4MEgnLOKR3s5m8="},
#   {activity: "Box", time_length: 60, description: "Empecé clases de box! A ver cómo me va!", like: 1, challenge_info_id: 6, evidence: "https://media.istockphoto.com/id/1133199973/es/foto/pareja-atletic-en-el-ring-de-boxeo.jpg?s=612x612&w=0&k=20&c=tojuaOfD2RluwNnVd926F14SyTZj8NYiU-5Ezi_M0KY="},
#   {activity: "Gym", time_length: 60, description: "Jalando fierro", like: 1, challenge_info_id: 3, evidence: "https://img.freepik.com/fotos-premium/selfie-retrato-fitness-hombre-negro-musculo-gimnasio-muestran-biceps-motivacion-bienestar-entrenamiento-cardiovascular-deportes-fuertes-cara-atleta-culturista-entrenamiento-ejercicio-objetivos_590464-145936.jpg"}
# ]

# puts "Entrando en la iteración"
# exercise_sessions.each do |exercise|
#   exercise = ExerciseSession.new(activity: exercise[:activity], time_length: exercise[:time_length], description: exercise[:description], like: exercise[:like], challenge_info_id: exercise[:challenge_info_id], evidence: exercise[:evidence])
#   file = URI.open(exercise[:evidence])
#   exercise.photo.attach(io: file, filename: exercise[:activity], content_type: "image/png")
#   exercise.save
# end

# puts "Creating a comment..."

# ExerciseComment.create!(
#   comments: "Está hermoso tu perro!",
#   exercise_session_id: 1,
#   user: User.all.sample
# )
# ExerciseComment.create!(
#   comments: "Deli! A mi me toca el miércoles!",
#   exercise_session_id: 2,
#   user: User.all.sample
# )

# puts "Creating an invite!!!"

# Invite.create!(
#   status: "Pending",
#   invitee_id: 2,
#   inviter_id: 1,
#   challenge_id: 1
# )

puts "Finishing :)"
