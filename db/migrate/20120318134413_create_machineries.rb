class CreateMachineries < ActiveRecord::Migration
  def change
    create_table :machineries do |t|
      t.string :name
      t.string :machine_type
      t.string :manufacturer

      t.timestamps
    end
  end
end
