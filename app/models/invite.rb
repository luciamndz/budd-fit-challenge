class Invite < ApplicationRecord

  STATUS = ["pending", "accepted", "declined"]

  validates satus:, inclusion: {in: STATUS}
  
  belongs_to :user
  belongs_to :challenge
end
