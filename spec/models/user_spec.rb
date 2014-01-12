require 'spec_helper'

describe User do
  it { should have_many(:memberships) }
  it { should have_many(:groups).through(:memberships) }

end
