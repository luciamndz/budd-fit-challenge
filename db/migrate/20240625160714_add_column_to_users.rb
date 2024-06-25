class AddColumnToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :nickname, :string, null: false, default: ""
  end
end
