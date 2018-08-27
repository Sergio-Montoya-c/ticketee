require "rails_helper"

RSpec.feature "User can sign out" do
  let(:user) { FactoryBot.create(:user)}

  before do 
    login_as(user)
  end

  scenario " correctly" do
    visit "/"
    click_link "Sign out"

    expect(page).to have_content "Signed out successfully"
  end
end