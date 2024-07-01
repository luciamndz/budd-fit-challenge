class ExerciseSession < ApplicationRecord
  belongs_to :challenge_info
  has_many :exercise_comments, dependent: :destroy
  validates :activity, :time_length, :description, presence: true
  #validates :photo, presence: true
  #validates :evidence, uniqueness: true
  has_one_attached :photo
end
