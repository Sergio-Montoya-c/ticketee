require 'rails_helper'

RSpec.feature 'User sign in' do
  let(:user) { FactoryBot.create(:user)}

  scenario 'with valid data' do
    visit "/"
    click_link "Sign In"
    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_button "Log in"

    expect(page).to have_content "Signed in successfully"
    expect(page).to have_content "Signed in as: #{user.email}"
  end
end