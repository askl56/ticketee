require 'rails_helper'

feature "Editing Projects" do
  before do
    sign_in_as!(FactoryGirl.create(:admin_user))
    FactoryGirl.create(:project, name: "TextMate 2")
    visit "/"
    click_link "TextMate 2"
    click_link "Edit Project"
  end

  scenario "Updating a project" do
    fill_in "Name", with: "TextMate 2 beta"
    click_button "Update Project"
    expect(page).to have_content("Project has been updated.")
  end
end
