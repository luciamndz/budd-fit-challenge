class AddColumnToChallenges < ActiveRecord::Migration[7.1]
  def change
    add_column :challenges, :duration, :integer
  end
end
