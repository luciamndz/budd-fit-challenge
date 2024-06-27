class DropTableFrienship < ActiveRecord::Migration[7.1]
  def change
    drop_table :frienships
  end
end
