require 'rails_helper'

RSpec.feature 'User create tickets for a project' do
  let(:user) { FactoryBot.create(:user)}

  before do
    login_as(user)
    project = FactoryBot.create(:project, name: 'Netscape')
    visit project_path(project)
    click_link 'New Ticket'
  end

  scenario 'with valid attributes' do
    fill_in 'ticket[name]', with: 'First ticket'
    fill_in 'ticket[description]', with: 'You must finish this ASAP!'
    click_button 'Create Ticket'

    expect(page).to have_content "Ticket has been created"
    within(".ticket") do
      expect(page).to have_content "Author: #{user.email}"
    end
  end

  scenario 'with invalid data' do
    click_button 'Create Ticket'

    expect(page).to have_content "Ticket has not been created."
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Description can't be blank"
  end

  scenario 'with description too short' do
    fill_in 'ticket[name]', with: 'First ticket'
    click_button 'Create Ticket'

    expect(page).to have_content 'Ticket has not been created'
    expect(page).to have_content 'Description is too short (minimum is 10 characters)'
  end

end