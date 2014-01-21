require 'spec_helper'

describe ProposedLocation do
  it { should belong_to :event }
  it { should have_many :votes }
  it { should have_many(:users).through(:votes) }
end
