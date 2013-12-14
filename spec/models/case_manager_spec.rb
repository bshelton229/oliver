require 'spec_helper'

describe CaseManager do
  it 'can be valid' do
    case_manager = build(:case_manager)
    expect(case_manager).to be_valid
  end

  it 'requires first_name and last_name' do
    case_manager = build(:case_manager, first_name: nil, last_name: nil)
    expect(case_manager).to_not be_valid
    expect(case_manager.errors[:first_name].first).to match %r(can't be blank)
    expect(case_manager.errors[:last_name].first).to match %r(can't be blank)
  end

  it 'should provide a full_name helper' do
    case_manager = build(:case_manager, first_name: 'Charles', last_name: 'Dickens')
    expect(case_manager.full_name).to eq "Charles Dickens"
  end

  it 'lightly validates the email address, lightly' do
    case_manager = build(:case_manager)
    expect(case_manager).to be_valid
    case_manager.email = 'new address'
    expect(case_manager).to_not be_valid
    expect(case_manager.errors[:email].first).to eq("email is not a valid email address")

    case_manager.email = 'something @somethingelse.com'
    expect(case_manager).to_not be_valid
    expect(case_manager.errors[:email].count).to eq 1

    case_manager.email = 'something@somethingelse.com'
    expect(case_manager).to be_valid
  end
end
