class CreateDealers < ActiveRecord::Migration
  def change
    create_table :dealers do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :street
      t.string :taluk
      t.string :district

      t.timestamps
    end
  end
end
