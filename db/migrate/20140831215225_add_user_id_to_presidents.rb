class AddUserIdToPresidents < ActiveRecord::Migration
  def change
      add_column :presidents, :user_id, :integer
      add_index :presidents, :user_id
  end
end
