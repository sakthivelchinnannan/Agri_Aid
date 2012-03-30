class AddIndexToMachinery < ActiveRecord::Migration
  def change
  	add_index :machineries, :machinerycategory_id
  end
end
