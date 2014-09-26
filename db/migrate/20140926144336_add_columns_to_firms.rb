class AddColumnsToFirms < ActiveRecord::Migration
  def change
    add_column :firms, :president, :string
    add_column :firms, :icon, :binary
    add_column :firms, :icon_content_type, :string
  end
end
