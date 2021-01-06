class CreateDevices < ActiveRecord::Migration[5.2]
  def change
    create_table :devices do |t|
      t.references :device_model, foreign_key: true
      t.references :room, foreign_key: true
      t.string :asset_no
      t.string :serial_no

      t.timestamps
    end
    add_index :devices, [:device_model_id, :serial_no], unique: true
  end
end
