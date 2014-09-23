class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :news
      t.string :last_modified

      t.timestamps
    end
  end
end
