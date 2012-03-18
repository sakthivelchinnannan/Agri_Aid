class DropTableMachineryToLends < ActiveRecord::Migration
  def change
	  drop_table :machinery_to_lends
  end
end
