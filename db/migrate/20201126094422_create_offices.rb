class CreateOffices < ActiveRecord::Migration[5.2]
  def change
    create_table :offices do |t|
      t.string :name
      t.string :address
      t.boolean :is_active

      t.timestamps
    end
  end
end
