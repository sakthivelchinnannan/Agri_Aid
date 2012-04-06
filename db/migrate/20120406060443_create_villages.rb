class CreateVillages < ActiveRecord::Migration
  def change
    create_table :villages do |t|
      t.integer :village_cd
      t.string :name
      t.integer :taluk_cd

      t.timestamps
    end
  end
end
