class AddNoteToDevices < ActiveRecord::Migration[5.2]
  def change
    add_column :devices, :note, :text
  end
end
