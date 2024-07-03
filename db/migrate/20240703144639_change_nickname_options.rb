class ChangeNicknameOptions < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :nickname, :string, null: true, default: nil
  end
end
