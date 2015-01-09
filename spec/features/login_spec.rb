require 'spec_helper.rb'

feature 'Login', js: true do
  scenario 'sign in with a registered user' do
    sign_up_with('test@example.com', 'Test User', 'foobarfoobar')
    click_on 'Logout'
    sign_in_with('test@example.com', 'foobarfoobar')
    expect(page).to have_content('Logout')
  end
end
