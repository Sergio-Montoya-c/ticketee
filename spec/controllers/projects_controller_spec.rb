require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  it 'handles a missin project correctly' do
    get :show, params: {id: 'random-project'} 

    expect(response).to redirect_to(projects_path)
    
    message = "The project you are looking for could not be found."
    expect(flash[:alert]).to eq message
  end
 end
