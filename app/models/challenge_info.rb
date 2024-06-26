class ChallengeInfo < ApplicationRecord

  STATUS = ["active", "inactive"]

  validates :user_status, inclusion: { in: STATUS }
  validates :user_score, presence: true

  belongs_to :user
  belongs_to :challenge
  has_many :exercise_sessions, dependent: :destroy
end
