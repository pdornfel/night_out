require 'spec_helper'

describe Event do

  it { should belong_to :group }
  it { should have_many :proposed_locations }

  it { should have_many :votes }

  it { should belong_to :user }

  it { should have_many(:comments).dependent(:destroy) }


end
