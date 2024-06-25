class CreateExerciseSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :exercise_sessions do |t|
      t.string :activity
      t.integer :time_length
      t.string :evidence
      t.text :description
      t.integer :like

      t.timestamps
    end
  end
end
