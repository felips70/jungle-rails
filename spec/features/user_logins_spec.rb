require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
    before :each do
      @user = User.create!(
        first_name: 'Spongebob',
        last_name: 'Squarepants',
        email: 'spongebob@jungle.com',
        password: 'password',
        password_confirmation: 'password'
      )
    end

    scenario "When they submit a login form the Products page is rendered" do
      visit '/login'
      fill_in id: 'email', with: 'spongebob@jungle.com'
      fill_in id: 'password', with: 'password'

      click_button 'Submit'

      expect(page).to have_content 'Spongebob Squarepants'

      save_screenshot
    end
end
