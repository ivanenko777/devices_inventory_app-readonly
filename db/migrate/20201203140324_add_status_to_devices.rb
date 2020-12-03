class AddStatusToDevices < ActiveRecord::Migration[5.2]
  def change
    add_column :devices, :status, :integer
    add_index :devices, :status
  end
end
