class CreateDeviceManufacturers < ActiveRecord::Migration[5.2]
  def change
    create_table :device_manufacturers do |t|
      t.string :name

      t.timestamps
    end
  end
end
