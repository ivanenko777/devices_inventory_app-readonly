class CreateDeviceTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :device_types do |t|
      t.string :name
      t.string :sys_name

      t.timestamps
    end
    add_index :device_types, :sys_name, unique: true
  end
end
