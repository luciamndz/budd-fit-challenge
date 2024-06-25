class CreateChallenges < ActiveRecord::Migration[7.1]
  def change
    create_table :challenges do |t|
      t.string :name
      t.time :time
      t.string :challenge_type
      t.string :activity
      t.string :status, default: "created"
      t.integer :global_score
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
