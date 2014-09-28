class AddParseStringToFirms < ActiveRecord::Migration
  def change
    add_column :firms, :parse_string, :string
  end
end
