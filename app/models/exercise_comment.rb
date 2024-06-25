class ExerciseComment < ApplicationRecord
  belongs_to :exercise_session
  validates :comment, presence: true
end
