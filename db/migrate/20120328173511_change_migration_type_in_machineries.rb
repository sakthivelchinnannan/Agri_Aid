class ChangeMigrationTypeInMachineries < ActiveRecord::Migration
  def up
  	remove_column :machineries, :machine_type
	add_column :machineries, :machinerycategory_id, :integer
  end

  def down
  end
end
