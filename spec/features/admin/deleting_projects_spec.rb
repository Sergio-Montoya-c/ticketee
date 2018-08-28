require 'rails_helper'

RSpec.feature 'User can deleted project' do
  before do
    login_as(FactoryBot.create(:user, :admin))
  end

  scenario 'successfully' do
    project = FactoryBot.create(:project, name: "Project to delete")

    visit '/'
    click_link "Project to delete"
    click_link "Delete Project"

    expect(page).to have_content "Project has been deleted."
    expect(page.current_url).to eq projects_url
    expect(page).to have_no_content "Project to delete"
  end
end