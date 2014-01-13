require 'spec_helper'

describe Group do
  it { should have_many(:memberships) }
  it { should have_many(:users).through(:memberships)}

end
