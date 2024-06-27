class AddEndDateToChallenge < ActiveRecord::Migration[7.1]
  def change
    add_column :challenges, :end_date, :string
  end
end
