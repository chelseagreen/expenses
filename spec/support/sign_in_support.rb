def sign_in_user
    visit new_user_registration_path
    fill_in('Email', :with => "email@email.com")
    fill_in('Password', :with => "password")
    fill_in('Password confirmation', :with => "password")
    click_button 'Sign up'
end