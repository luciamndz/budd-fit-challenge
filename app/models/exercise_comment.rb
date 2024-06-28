class ExerciseComment < ApplicationRecord
  belongs_to :exercise_session
  validates :comments, presence: true
  belongs_to :user
end
