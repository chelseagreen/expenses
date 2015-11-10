class ChangePriceType < ActiveRecord::Migration
    def change
        change_column :expenses, :cost, :decimal, :scale => 2
    end 
end
