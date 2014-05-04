class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.references :archive, null: false
      t.string :title
      t.string :url, null: false
      t.text :html

      t.timestamps

      t.index [:archive_id, :url], unique: true
    end
  end
end
