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
end
