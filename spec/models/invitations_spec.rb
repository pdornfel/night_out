require 'spec_helper'

describe Invitation do

  it { should validate_presence_of :email }

  it "Should send an email to the inputted user" do
    invitation = FactoryGirl.create(:invitation)
  end

end
