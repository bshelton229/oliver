require 'spec_helper'

describe User do
  it 'Should require an email' do
    user = build(:user, email: nil)
    expect(user).to_not be_valid
    expect(user.errors[:email].first).to match %r{can't be blank}

    user.email = 'wrong'
    expect(user).to_not be_valid
    expect(user.errors[:email].first).to match %r{is invalid}
  end

  it 'Should be able to create a user' do
    user = create(:user)
    expect(user).to be_valid
  end

  it 'Should validate password length' do
    user = User.new email: 'test@user.com', password: '1234567'
    expect(user).to_not be_valid
    expect(user.errors[:password].first).to match %r{too short}

    user.password = '12345678'

    expect(user).to be_valid
    expect(user.save).to be_true
  end

  it 'Should allow phrase passwords' do
    user = create(:user, password: 'eat your spinach')
    expect(user).to be_persisted
  end
end
