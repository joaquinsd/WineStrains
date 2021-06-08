require 'rails_helper'

RSpec.describe Strain, type: :model do
  it "is not allowed to have empty name" do
    s1 = Strain.create(name: 'Carmenere')
    s2 = Strain.create(name: nil)
    s3 = Strain.create(name: '')

    expect(s2).to_not be_valid
    expect(s3).to_not be_valid 
  end

  it "is not allowed for grape names to be duplicate" do
    s1 = Strain.create(name: 'Carmenere')
    s2 = Strain.create(name: 'Carmenere')

    expect(s2).to_not be_valid
  end
end
