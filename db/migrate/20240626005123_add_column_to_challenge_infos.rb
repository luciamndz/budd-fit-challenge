class AddColumnToChallengeInfos < ActiveRecord::Migration[7.1]
  def change
    add_column :challenge_infos, :user_status, :string
  end
end
