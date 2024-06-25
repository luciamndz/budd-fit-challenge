class CreateExerciseComments < ActiveRecord::Migration[7.1]
  def change
    create_table :exercise_comments do |t|
      t.text :comments
      t.references :exercise_session, null: false, foreign_key: true

      t.timestamps
    end
  end
end
