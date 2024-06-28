class AddUserIdToComments < ActiveRecord::Migration[7.1]
  def change
    add_reference :exercise_comments, :user, null: false
  end
end
