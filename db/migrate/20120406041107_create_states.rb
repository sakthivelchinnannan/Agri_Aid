class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.integer :state_cd
      t.string :name

      t.timestamps
    end
  end
end
