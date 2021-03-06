require 'rails_helper'

RSpec.feature "Projects", type: :feature do
  context "Create new project" do
    before(:each) do
      visit new_post_path
      within("form") do
        fill_in "Title", with: "Test title"
      end
    end

    scenario "should be successful" do
      fill_in "Content", with: "Content"
      click_button "Create Post"
      expect(page).to have_content("Post was successfully created.")
    end

    scenario "should fail" do
      click_button "Create Post"
      expect(page).to have_content("Description can't be blank")
    end
  end

  context "Update Post" do
    let(:project) { Post.create(title: "Test title", content: "Test content") }
    before(:each) do
      visit edit_post_path(project)
    end

    scenario "should be successful" do
      within("form") do
        fill_in "Content", with: "New description content"
      end
      click_button "Update Post"
      expect(page).to have_content("Post was successfully updated.")
    end

    scenario "should fail" do
      within("form") do
        fill_in "Content", with: ""
      end
      click_button "Update Post"
      expect(page).to have_content("Description can't be blank")
    end
  end

  context "Remove existing project" do
    let!(:project) { Post.create(title: "Test title", content: "Test content") }
    scenario "remove project" do
      visit posts_path
      click_link "Destroy"
      expect(page).to have_content("Post was successfully destroyed.")
      expect(Post.count).to eq(0)
    end
  end
end