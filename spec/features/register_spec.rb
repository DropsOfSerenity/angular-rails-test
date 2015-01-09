require 'spec_helper.rb'

feature 'Registration', js: true do
  scenario 'registering a user with valid info' do
    sign_up_with('test@example.com', 'Test User', 'foobarfoobar')

    expect(page).to have_content('Logout')
  end

  scenario 'registering with invalid info' do
    sign_up_with('', '', '')

    expect(page).to have_content('Login')
    expect(page).to have_content('Register')
  end
end
