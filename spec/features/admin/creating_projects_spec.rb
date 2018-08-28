require 'rails_helper'

RSpec.feature 'User can create new project' do

  before do
    login_as(FactoryBot.create(:user, :admin))
    visit '/'
    click_link 'New Project'
  end

  scenario 'with valida attributes' do
    fill_in 'project[name]', with: 'React JS'
    fill_in 'project[description]', with: 'An awesome FrontEnd Framework'
    click_button 'Create Project'

    expect(page).to have_content "The project was successfully created!"

    title = "React JS - Projects - Ticketee"
    expect(page).to have_title title
  end

  scenario 'when providing invalid data' do
    click_button 'Create Project'

    expect(page).to have_content "Project has not been created."
    expect(page).to have_content "Name can't be blank"
  end

end