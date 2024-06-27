class Invite < ApplicationRecord
  STATUS = ["Pending", "Accepted", "Declined"]

  validates :status, inclusion: { in: STATUS }

  belongs_to :invitee, class_name: "User"
  belongs_to :inviter, class_name: "User"
  belongs_to :challenge

end
