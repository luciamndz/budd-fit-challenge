class ExerciseSession < ApplicationRecord
  has_many :exercise_comments, dependent: :destroy
  validates :activity, :time_length, :evidence, :description, presence: true
  validates :evidence, uniqueness: true
  has_one_attached :photo
end
