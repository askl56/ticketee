require 'rails_helper'

feature "Editing Projects" do
  scenario "Updating a project" do
    FactoryGirl.create(:project, name: "TextMate 2")
    visit "/"
    click_link "TextMate 2"
    click_link "Edit Project"
    fill_in "Name", with: "TextMate 2 beta"
    click_button "Update Project"
    expect(page).to have_content("Project has been updated.")
  end
end
