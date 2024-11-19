class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.integer :patient_number,          null: false, unique: true
      t.string  :patient_last_name,       null: false
      t.string  :patient_first_name,      null: false
      t.string  :patient_last_name_kana,  null: false
      t.string  :patient_first_name_kana, null: false
      t.date    :birthday, null: false
      t.integer :floor
      t.integer :room
      t.timestamps
    end
  end
end