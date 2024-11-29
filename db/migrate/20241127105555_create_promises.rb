class CreatePromises < ActiveRecord::Migration[7.0]
  def change
    create_table :promises do |t|
      t.references :family,       null: false, foreign_key: true
      t.references :patient,      null: false, foreign_key: true
      t.date :day,                null: false
      t.integer :meeting_time_id, null: false
      t.datetime :start_time,     null: false
      t.timestamps
    end
  end
end
