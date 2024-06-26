class ChangeReferencesToInvite < ActiveRecord::Migration[7.1]
  def change
    remove_reference :invites, :user, index: true
    add_reference :invites, :invitee, index: true
    add_reference :invites, :inviter, index: true
  end
end
