require 'rails_helper'

RSpec.feature 'User can edit projects' do
  before do
    FactoryBot.create(:project, name: 'React JS Training')
    
    visit '/'
    click_link 'React JS Training'
    click_link 'Edit Project'
  end

  scenario 'with valid attributes' do
    fill_in 'Name', with: 'React JS Edited'
    click_button "Update Project"
    
    expect(page).to have_content "Project has been updated."
    expect(page).to have_content "React JS Edited"
  end
  
  scenario 'with invalid attributes' do
    fill_in 'Name', with: ''
    click_button "Update Project"

    expect(page).to have_content "Project has not been updated."
  end
end 