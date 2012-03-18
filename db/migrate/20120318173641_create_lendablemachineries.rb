class CreateLendablemachineries < ActiveRecord::Migration
  def change
    create_table :lendablemachineries do |t|
      t.integer :machinery_id
      t.integer :lender_id
      t.integer :numofmachines
      t.float :rateperhr

      t.timestamps
    end
    add_index :lendablemachineries, :lender_id
	add_index :lendablemachineries, :machinery_id
	add_index :lendablemachineries, [:lender_id, :machinery_id], unique: true
  end
end
