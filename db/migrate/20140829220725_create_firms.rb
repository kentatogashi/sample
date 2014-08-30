class CreateFirms < ActiveRecord::Migration
  def change
    create_table :firms do |t|
      t.integer :president_id
      t.string :name
      t.string :address
      t.string :telephone
      t.string :business
      t.text :note

      t.timestamps
    end
  end
end
