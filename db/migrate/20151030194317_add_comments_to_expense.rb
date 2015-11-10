class AddCommentsToExpense < ActiveRecord::Migration
  def change
    add_column :expenses, :comments, :string
  end
end
