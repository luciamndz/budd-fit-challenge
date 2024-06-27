class CreateInvites < ActiveRecord::Migration[7.1]
  def change
    create_table :invites do |t|
      t.string :status, default: "Pending"
      t.references :inviter, foreign_key: { to_table: :users }
      t.references :invitee, foreign_key: { to_table: :users }
      t.references :challenge, null: false, foreign_key: true
      t.timestamps
    end
  end
end
