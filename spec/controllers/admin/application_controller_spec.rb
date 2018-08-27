require 'rails_helper'

RSpec.describe Admin::ApplicationController, type: :controller do
  let(:user) {FactoryBot.create(:user)}

  before do
    allow(controller).to receive(:authenticate_user!)
    allow(controller).to receive(:current_user).and_return(user)
  end
  
  context "No admin users" do
    it "are not able to see admin page" do
      get :index
      expect(response).to redirect_to "/"
      expect(flash[:alert]).to eq "You must be and admin to see this page."    
    end    
  end

end
