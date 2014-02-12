require 'spec_helper'

describe Nag do

  it { should belong_to :group }
  it { should belong_to :user }

  it { should validate_presence_of :body }

end
