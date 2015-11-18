require "rails_helper"
require "spec_helper"
require "support/sign_in_support"


describe "expense saving process" do 
  it "saves expense correctly" do
  	sign_in_user
    visit new_expense_path 
    fill_in('Item', :with => "cheese")
    fill_in('Cost', :with => "65")
    click_button 'Save'
    expect(page).to have_content "cheese"
  end
end