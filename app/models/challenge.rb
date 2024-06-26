class Challenge < ApplicationRecord

  TYPES = ["public", "private"].freeze
  STATUS = ["created", "active", "finished"].freeze
  ACTIVITIES = ["open", "swimming", "running", "weight lifting", "crossfit", "barre", "pilates", "indoor cycling", "boxing", "other"].freeze

  validates :challenge_type, inclusion: { in: TYPES }
  validates :status, inclusion: { in: STATUS }
  validates :activity, inclusion: { in: ACTIVITIES }

  belongs_to :user
  has_many :invites
  has_many :challenge_infos
  has_many :users, through: :challenge_infos

#   Event.users

#   ´pedriot 100
#   ñu 12
#   omae 422

#   Users.evemt

#   challenge.users.each do |u|
#    <li> u.name</li>
#     if challenge.user == current_user
#       boton de destruir, este boton te redirige a el controllador challenge_info#destroy
#     end
#   [
#     User1
#     User2
end
