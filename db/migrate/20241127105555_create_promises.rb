class CreatePromises < ActiveRecord::Migration[7.0]
  def change
    create_table :promises do |t|
      t.references :family_id,  null: false
      t.references :patient_id, null: false
      t.date :day,              null: false
      t.time :integer,          null: false
      t.timestamps
    end
  end
end
