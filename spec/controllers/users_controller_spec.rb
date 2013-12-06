require 'spec_helper'

describe UsersController do
  it 'Should require a user to be logged in' do
    get :index
    expect(response).to_not be_successful
    expect(response).to redirect_to(new_user_session_path)
  end

  context 'Logged in' do
    let(:user) { create(:user) }
    before(:each) { sign_in(user) }

    it 'Should show users' do
      get :index
      expect(response).to be_successful
      expect(assigns(:users)).to be_an ActiveRecord::Relation
    end
  end
end
