class CreateTaluks < ActiveRecord::Migration
  def change
    create_table :taluks do |t|
      t.integer :taluk_cd
      t.string :name
      t.integer :district_cd

      t.timestamps
    end
  end
end
