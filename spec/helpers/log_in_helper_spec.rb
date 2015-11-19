require 'rails_helper'

def log_in
  User.create(:email => 'user@example.com', :password => 'password')
    visit new_user_session_path
    fill_in 'Email', :with => 'user@example.com'
    fill_in 'Password', :with => 'password'
    click_button 'Log in'
end
