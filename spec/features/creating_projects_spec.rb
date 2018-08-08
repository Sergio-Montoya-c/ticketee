require 'rails_helper'

RSpec.feature 'User can create new project' do
  scenario 'with valida attributes' do
    visit '/'
    click_link 'New Project'
    fill_in 'Name', with: 'React JS'
    fill_in 'Description', with: 'An awesome FrontEnd Framework'
    click_button 'Create Project'
    expect(page).to have_content "The project was successfully created!"
  end
end