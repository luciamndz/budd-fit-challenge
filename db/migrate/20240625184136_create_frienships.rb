class CreateFrienships < ActiveRecord::Migration[7.1]
  def change
    create_table :frienships do |t|
      t.string :status
      t.references :asker, foreign_key: { to_table: :users }
      t.references :reciever, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
