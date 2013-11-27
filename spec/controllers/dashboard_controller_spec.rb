require 'spec_helper'

describe DashboardController do
  it 'Should require a user to be logged in' do
    get :show
    expect(response).to_not be_successful
    expect(response).to redirect_to(new_user_session_path)
  end

  context 'logged in' do
    let(:user) { create(:user) }
    before(:each) { sign_in(user) }

    it 'Should show the dashboard to logged in users' do
      get :show
      expect(response).to be_successful
    end
  end
end
