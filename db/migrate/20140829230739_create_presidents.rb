class CreatePresidents < ActiveRecord::Migration
  def change
    create_table :presidents do |t|
      t.string :name
      t.binary :icon
      t.string :icon_content_type

      t.timestamps
    end
  end
end
