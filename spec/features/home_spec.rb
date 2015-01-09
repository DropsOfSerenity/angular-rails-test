require 'spec_helper.rb'

feature 'Post Homepage', js: true do
  scenario 'registering a user with valid info' do
    visit '/register'

    fill_in 'Email Address', with: 'test@example.com'
    fill_in 'Username', with: 'Test Username'
    fill_in 'Password', with: 'foobarfoobar'
    click_button 'Register'

    expect(page).to have_content('Logout')
  end

  scenario 'registering with invalid info' do
    visit '/register'
    click_button 'Register'

    expect(page).to have_content('Login')
    expect(page).to have_content('Register')
  end
end
