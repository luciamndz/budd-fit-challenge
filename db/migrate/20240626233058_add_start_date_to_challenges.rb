class AddStartDateToChallenges < ActiveRecord::Migration[7.1]
  def change
    add_column :challenges, :start_date, :string
  end
end
