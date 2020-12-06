class AddCreatedByAndUpdatedByToDevices < ActiveRecord::Migration[5.2]
  def change
    add_column :devices, :created_by_id, :integer
    add_column :devices, :updated_by_id, :integer

    add_index :devices, :created_by_id
    add_index :devices, :updated_by_id
  end
end
