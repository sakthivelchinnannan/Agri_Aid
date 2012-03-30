class CreateMachinerycategories < ActiveRecord::Migration
  def change
    create_table :machinerycategories do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
	add_index :machinerycategories, :name, unique: true
  end
end
