require 'spec_helper'

describe Group do
  it { should have_many(:memberships) }
  it { should have_many(:users).through(:memberships)}
  it { should have_many(:events).dependent(:destroy) }

end
