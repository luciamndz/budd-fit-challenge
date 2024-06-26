class Challenge < ApplicationRecord
  include PgSearch::Model
  belongs_to :user
  has_many :invites, dependent: :destroy
  has_many :challenge_infos, dependent: :destroy
  has_many :users, through: :challenge_infos

  TYPES = ["public", "private"].freeze
  STATUS = ["created", "active", "finished"].freeze
  ACTIVITIES = ["open", "swimming", "running", "weight lifting", "crossfit", "barre", "pilates", "indoor cycling", "boxing", "other"].freeze

  validates :challenge_type, inclusion: { in: TYPES }
  validates :status, inclusion: { in: STATUS }
  validates :activity, inclusion: { in: ACTIVITIES }


  pg_search_scope :search_by_name_and_activity,
                  against: [ :name, :activity ],
                  using: {
                    tsearch: { prefix: true }
                  }
end
