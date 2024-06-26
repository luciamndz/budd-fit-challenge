class Challenge < ApplicationRecord
  include PgSearch::Model
  belongs_to :user
  has_many :invites
  has_many :challenge_infos
  has_many :users, through: :challenge_infos

  TYPES = ["Public", "Private"].freeze
  STATUS = ["created", "active", "finished"].freeze
  ACTIVITIES = ["Open", "Swimming", "Running", "Weight Lifting", "Crossfit", "Barre", "Pilates", "Indoor Cycling", "Boxing", "Other"].freeze

  validates :challenge_type, inclusion: { in: TYPES }
  validates :status, inclusion: { in: STATUS }
  validates :activity, inclusion: { in: ACTIVITIES }


  pg_search_scope :search_by_name_and_activity,
                  against: [ :name, :activity ],
                  using: {
                    tsearch: { prefix: true }
                  }
end
