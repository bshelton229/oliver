require 'spec_helper'

describe Family do
  it 'can create a family' do
    expect(create(:family)).to be_valid
  end

  it 'can be assigned a case manager' do
    family = create(:family)
    family.case_manager = create(:case_manager)
    expect(family.case_manager).to be_persisted
    expect(family.case_manager).to eq CaseManager.find(family.case_manager_id)
  end
end
