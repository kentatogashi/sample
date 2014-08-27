class CreateFirms < ActiveRecord::Migration
  def change
    create_table :firms do |t|
      t.string :name
      t.string :president
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
