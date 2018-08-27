require 'rails_helper'

RSpec.feature 'User can view tickets' do
  let(:author) {FactoryBot.create(:user)}

  before do
    react_project = FactoryBot.create(:project, name: "React JS Project")
    ticket = FactoryBot.create(:ticket, project: react_project, name: 'Create React App', description: 'Create a React application', author: author )
    express_project = FactoryBot.create(:project, name: "Express Project ")
    ticket = FactoryBot.create(:ticket, project: express_project, name: 'Create an express backend', description: 'Create an express backend', author: author )

    visit '/'
  end

  scenario 'with the project details' do
    click_link 'React JS Project'

    expect(page).to have_content 'Create React App'
    expect(page).to_not have_content 'Create an epxress backend'
    click_link 'Create React App'
    within("h1") do
      expect(page).to have_content 'Create React App'
    end
    expect(page).to have_content 'Create a React application'
  end
end