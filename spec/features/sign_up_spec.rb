require 'rails_helper'

RSpec.feature 'User can sign up' do

  scenario 'with valid data' do
    visit '/'
    click_link "Sign Up"
    fill_in "Email", with: "text@example.com"
    fill_in "user_password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"

    expect(page).to have_content("You have signed up successfully.")
  end
  
end 