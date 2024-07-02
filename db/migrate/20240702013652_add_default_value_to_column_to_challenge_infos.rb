class AddDefaultValueToColumnToChallengeInfos < ActiveRecord::Migration[7.1]
  def change
    change_column :challenge_infos, :user_score, :integer, default: 0
    change_column :challenge_infos, :user_status, :string, default: 'active'
  end
end
