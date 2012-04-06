class CreateDistricts < ActiveRecord::Migration
  def change
    create_table :districts do |t|
      t.integer :district_cd
      t.string :name
      t.integer :state_cd

      t.timestamps
    end
  end
end
