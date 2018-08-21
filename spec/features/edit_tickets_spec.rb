require 'rails_helper'

RSpec.feature 'User can edit tickets' do
  let(:project) { FactoryBot.create(:project)}
  let(:ticket) { FactoryBot.create(:ticket, project: project)}

  before do
    visit project_ticket_path(project, ticket)
    click_link "Edit Ticket"
  end

  scenario 'with valid attributes' do
    fill_in 'ticket[name]', with: 'Project edited to something different'
    fill_in 'ticket[description]', with: 'Description changed to something else'
    click_button 'Update Ticket'
    
    expect(page).to have_content "Ticket has been updated"
    expect(page).to have_content "Project edited to something different"
    expect(page).to have_content "Description changed to something else"
    expect(page).to_not have_content ticket.name
    expect(page).to_not have_content ticket.description
  end
  
  scenario 'with invalid attribues' do
    fill_in 'ticket[name]', with: ''
    click_button 'Update Ticket'
    
    expect(page).to have_content "Ticket has not been updated"
  end
end 