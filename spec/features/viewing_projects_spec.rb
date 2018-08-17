require 'rails_helper'

RSpec.feature 'User can view projects' do
  scenario 'with the project details' do
    project = FactoryBot.create(:project, name: "React JS Project")
    visit '/'
    click_link "React JS Project"
    expect(page.current_url).to eq project_url(project)
  end
end