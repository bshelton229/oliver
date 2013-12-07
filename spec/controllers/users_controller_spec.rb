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

    it 'Should allow us to create a user' do
      post :create, user: { email: 'new@user.com', password: 'myfavoritepassword' }
      expect(response).to redirect_to(users_path)
      expect(assigns(:user)).to be_valid
    end

    it 'Should allow us to delete a user' do
      user2 = create(:user, email: 'another@user.com')
      user2_id = user2.id
      delete :destroy, id: user2.id
      expect(response).to redirect_to(users_path)
      expect(assigns(:user)).to_not be_persisted
      expect(User.find_by id: user2_id).to be_nil
    end

    it 'Should not let us delete the active user' do
      delete :destroy, id: user.id
      expect(response).to redirect_to users_path
      expect(assigns(:user)).to be_persisted
    end

    it 'Should not let us update the logged in user' do
      patch :update, id: user.id, user: { email: 'mynew@email.com' }
      expect(response).to redirect_to(users_path)
      expect(User.find(user.id).email).to_not eq('mynew@email.com')
    end

    it 'Should be able to update other users' do
      user2 = create(:user, email: 'another@email.com')
      patch :update, id: user2.id, user: { email: 'new@email.com' }
      expect(response).to redirect_to users_path
      expect(assigns(:user)).to be_valid
      expect(assigns(:user).email).to eq("new@email.com")
      expect(assigns(:user)).to be_persisted
    end
  end
end
