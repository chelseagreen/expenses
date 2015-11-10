class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :item
      t.string :cost
      t.string :date

      t.timestamps null: false
    end
  end
end
