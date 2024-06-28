class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :invites_as_inviter, class_name: "Invite", foreign_key: :inviter_id
  has_many :invites_as_invitee, class_name: "Invite", foreign_key: :invitee_id
  has_many :challenge_infos
  has_many :challenges, through: :challenge_infos
  has_one_attached :photo
  has_many :comments, dependent: :destroy
end
