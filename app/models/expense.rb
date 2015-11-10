class Expense < ActiveRecord::Base
	belongs_to :user 
	accepts_nested_attributes_for :user
	
    validates :item, presence: true,
    length: { minimum: 3 }
end