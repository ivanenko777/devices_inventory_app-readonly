class CreateDeviceModels < ActiveRecord::Migration[5.2]
  def change
    create_table :device_models do |t|
      t.string :name
      t.references :device_manufacturer, foreign_key: true
      t.references :device_type, foreign_key: true
      t.boolean :is_active

      t.timestamps
    end
    add_index :device_models, [:device_type_id, :device_manufacturer_id, :name], unique: true,
              name: 'index_device_models_unique_model'
  end
end
