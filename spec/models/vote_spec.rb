require 'spec_helper'

describe Vote do
  it { should belong_to :user }
  it { should belong_to :proposed_location }
  it { should belong_to :event }
end
