class AddIndexToLendersEmail < ActiveRecord::Migration
  def change
      add_index :lenders, :email, unique: true
  end
end
