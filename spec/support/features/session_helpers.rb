module Features
  module SessionHelpers
    def sign_up_with(email, username, password)
      visit '/register'

      fill_in 'Email Address', with: email
      fill_in 'Username', with: username
      fill_in 'Password', with: password
      click_button 'Register'
    end
  end
end
