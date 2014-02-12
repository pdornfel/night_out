require 'spec_helper'

describe Nag do

  it { should belong_to :group }
  it { should belong_to :user }

  it { should validate_presence_of :body }

  it "sends a mailer to group members when a nag is created" do
    nag = FactoryGirl.create(:nag)
    expect(NagMailer).to eq 1
  end

end
