class AddRememberTokenToLenders < ActiveRecord::Migration
  def change
    add_column :lenders, :remember_token, :string
    add_index  :lenders, :remember_token
  end
end
