require 'rails_helper'

RSpec.feature 'User can delete tickets' do
  let(:project) {FactoryBot.create(:project)}
  let(:author) {FactoryBot.create(:user)}
  let(:ticket) {FactoryBot.create(:ticket, project: project, author: author)}

  before do
    visit project_ticket_path(project, ticket)
  end

  scenario 'with no errors' do
    click_link 'Delete Ticket'

    expect(page).to have_content 'Ticket has been deleted'
    expect(page.current_url).to eq project_url(project)
  end
  
end 