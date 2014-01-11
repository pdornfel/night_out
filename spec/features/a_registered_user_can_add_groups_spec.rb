require 'spec_helper'

feature "A registered user can create groups => " do

  let(:new_user) { FactoryGirl.build(:user) }

  scenario "A user enters in all the valid information" do
    group = FactoryGirl.create(:group)
    sign_up_as(new_user)
    visit new_group_path
    fill_in "Group Name", with: group.name
    click_button "Create Group"
    expect(page).to have_content("Group successfully created")
  end

end