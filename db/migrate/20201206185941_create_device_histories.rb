class CreateDeviceHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :device_histories do |t|
      t.references :device, foreign_key: true
      t.references :room, foreign_key: true
      t.integer :status_id
      t.integer :created_by_id

      t.timestamps
    end
    add_index :device_histories, :created_by_id
  end
end
