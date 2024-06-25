class AddColumnToExerciseSessions < ActiveRecord::Migration[7.1]
  def change
    add_reference :exercise_sessions, :challenge_info, null: false, foreign_key: true
  end
end
