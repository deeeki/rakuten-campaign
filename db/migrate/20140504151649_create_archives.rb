class CreateArchives < ActiveRecord::Migration
  def change
    create_table :archives do |t|
      t.date :displayed_on, null: false

      t.timestamps

      t.index :displayed_on, unique: true
    end
  end
end
