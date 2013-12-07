require 'spec_helper'

describe UserProfileController do
  it 'Should require a user to be logged in' do
    get :edit
    expect(response).to_not be_successful
    expect(response).to redirect_to(new_user_session_path)
  end

  context 'logged in' do
    let(:user) { create(:user) }
    before(:each) { sign_in(user) }

    it 'Should allow a user to see an edit form' do
      get :edit
      expect(assigns(:user)).to eq(user)
    end

    it 'Should allow a user to update their password' do
      patch :update, user: { password: 'mynewpassword', name: 'NEW NAME' }
      expect(response).to redirect_to(root_path)
      expect(assigns(:user)).to be_persisted
      expect(assigns(:user).name).to eq('NEW NAME')
    end
  end
end
