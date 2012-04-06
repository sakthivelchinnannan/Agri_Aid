class ChangeLendersTable < ActiveRecord::Migration
  def up
	change_table :lenders do |t|
		t.remove :taluk, :district
		t.integer :village_cd, :taluk_cd, :district_cd, :state_cd
	end
  end

  def down
  end
end
