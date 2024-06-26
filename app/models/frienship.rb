class Frienship < ApplicationRecord
  STATUS = ["pending", "accepted", "declined"]

  validates :status, inclusion: { in: STATUS }

  belongs_to :asker, class_name: "User"
  belongs_to :reciever, class_name: "User"

end
