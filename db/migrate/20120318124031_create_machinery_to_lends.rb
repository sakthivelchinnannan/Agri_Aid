class CreateMachineryToLends < ActiveRecord::Migration
  def change
    create_table :machinery_to_lends do |t|
      t.integer :machineid
      t.integer :lenderid
      t.integer :numofmachines
      t.float :rateperhour

      t.timestamps
    end

    add_index :machinery_to_lends, :machineid
    add_index :machinery_to_lends, :lenderid
    add_index :machinery_to_lends, [:machineid, :lenderid], unique: true
  end
end
