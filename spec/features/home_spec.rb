require 'spec_helper.rb'

include Warden::Test::Helpers
Warden.test_mode!

feature 'Home', js: true do
  context 'Already logged in user' do
    before(:each) do
      @user = FactoryGirl.create(:user)
      login_as(@user, :scope => :user)
    end

    scenario 'make a post' do
      visit '/'
      fill_in 'Title', with: 'Post Title'
      fill_in 'Text', with: 'Body Text'
      click_button 'post'

      expect(page).to have_content('Post Title (0)')
    end
  end

  context 'User not logged in' do
    scenario 'make a post' do
      visit '/'
      expect(page).to have_content('You must be logged in to post')
    end
  end
end

