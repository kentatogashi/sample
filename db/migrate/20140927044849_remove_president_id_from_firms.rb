class RemovePresidentIdFromFirms < ActiveRecord::Migration
  def change
    remove_column :firms, :president_id, :integer
  end
end
