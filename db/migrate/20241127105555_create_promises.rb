class CreatePromises < ActiveRecord::Migration[7.0]
  def change
    create_table :promises do |t|

      t.timestamps
    end
  end
end
