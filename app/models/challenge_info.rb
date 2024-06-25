class ChallengeInfo < ApplicationRecord
  belongs_to :user
  belongs_to :challenge

  validates :user_score, presence: true
end
