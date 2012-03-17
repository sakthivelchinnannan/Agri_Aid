class AddIndexToFarmersPhone < ActiveRecord::Migration
  def change
      add_index :farmers, :phone, unique: true
  end
end
