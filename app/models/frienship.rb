class Frienship < ApplicationRecord
  STATUS = ["Pending", "Accepted", "Declined"]

  validates :status, inclusion: { in: STATUS }

  belongs_to :asker, class_name: "User"
  belongs_to :reciever, class_name: "User"

end
