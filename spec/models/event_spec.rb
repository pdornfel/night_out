require 'spec_helper'

describe Event do

  it { should belong_to :group }
  it { should have_many :proposed_locations }


end
