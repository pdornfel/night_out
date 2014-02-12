require 'spec_helper'

feature "A registered user can add other registered users to groups" do

    let(:user1) { FactoryGirl.create(:user) }
    let(:user2) { FactoryGirl.create(:user) }

    scenario "when a registered user exists and is added to a group they are added" do
      group ||= FactoryGirl.create(:group)
      sign_in_as(user1)
      click_link "Create Group"
      fill_in "Group Name", with: group.name
      click_button "Create Group"
      expect(page).to have_content("Group successfully created")
      expect(page).to have_content("Ballers")
      # click_link group.name
      # visit group_path(group)
      # save_and_open_page
      # fill_in "membership_email", with: user2.email
    end

end