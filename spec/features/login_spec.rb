require 'spec_helper.rb'

include Warden::Test::Helpers
Warden.test_mode!

feature 'Login', js: true do
  context 'Already registered user' do
    before(:each) do
      @user = FactoryGirl.create(:user)
    end

    scenario 'sign in with a registered user' do
      sign_in_with(@user.email, @user.password)
      expect(page).to have_content('Logout')
    end
  end
end
