require 'rails_helper'

describe "the signup process", :type => :feature do 
  before :each do 
    visit new_user_registration_path 
  end 
  it "creates and signs in new user successfully" do 
    fill_in('Email', :with => "email@email.com")
    fill_in('Password', :with => "password")
    fill_in('Password confirmation', :with => "password")
    click_button 'Sign up'
    expect(page).to have_content 'About'
  end
end 

describe "the signin process", :type => :feature do
  before :each do
    User.create(:email => 'user@example.com', :password => 'password')
    visit new_user_session_path
  end

  it "signs in successfully" do
    fill_in 'Email', :with => 'user@example.com'
    fill_in 'Password', :with => 'password'
    click_button 'Log in'
    expect(page).to have_content 'About'
  end

  it "incorrect password at signin" do
    fill_in 'Email', :with => 'user@example.com'
    fill_in 'Password', :with => 'wrong'
    click_button 'Log in'
    expect(page).to have_content 'Forgot your password?'
  end
end
