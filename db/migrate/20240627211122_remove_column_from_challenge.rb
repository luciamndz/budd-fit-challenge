class RemoveColumnFromChallenge < ActiveRecord::Migration[7.1]
  def change
    remove_column :challenges, :duration
  end
end
