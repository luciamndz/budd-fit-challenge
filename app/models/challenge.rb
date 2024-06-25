class Challenge < ApplicationRecord

  TYPES = ["public", "private"].freeze
  STATUS = ["created", "active", "finished"].freeze
  ACTIVITIES = ["open", "swimming", "running", "weight lifting", "crossfit", "barre", "pilates", "indoor cycling", "boxing", "other"].freeze

  validates :challenge_type, inclusion: { in: TYPES }
  validates :status, inclusion: { in: STATUS }
  validates :activity, inclusion: { in: ACTIVITIES }

  belongs_to :user
  has_many :invites
end
