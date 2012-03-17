class CreateFarmers < ActiveRecord::Migration
  def change
    create_table :farmers do |t|
      t.string :name
      t.string :phone
      t.string :village
      t.string :taluk
      t.string :district

      t.timestamps
    end
  end
end
