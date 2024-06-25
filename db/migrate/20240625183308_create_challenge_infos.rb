class CreateChallengeInfos < ActiveRecord::Migration[7.1]
  def change
    create_table :challenge_infos do |t|
      t.integer :user_score
      t.boolean :attendance, default: false
      t.references :user, null: false, foreign_key: true
      t.references :challenge, null: false, foreign_key: true

      t.timestamps
    end
  end
end
