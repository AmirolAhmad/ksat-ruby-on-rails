require 'spec_helper'

describe "Creating ksat lists" do
	it "redirects to the ksat list index page on success" do
		visit "/ksat_lists"
		click_link "New Ksat list"
		expect(page).to have_content("New ksat_list")

		fill_in "Title", with: "My task list"
		fill_in "Description", with: "This is what I'm doing today."
		click_button "Create Ksat list"

		expect(page).to have_content("My task list")
	end

	it "displays an error when the task list has no title" do
		expect(KsatList.count).to eq(0)

		visit "/ksat_lists"
		click_link "New Ksat list"
		expect(page).to have_content("New ksat_list")

		fill_in "Title", with: ""
		fill_in "Description", with: "This is what I'm doing today."
		click_button "Create Ksat list"

		expect(page).to have_content("error")
		expect(KsatList.count).to eq(0)

		visit "/ksat_lists"
		expect(page).to_not have_content("This is what I'm doing today.")
	end

	it "displays an error when the task list has a title less than 3 characters" do
		expect(KsatList.count).to eq(0)

		visit "/ksat_lists"
		click_link "New Ksat list"
		expect(page).to have_content("New ksat_list")

		fill_in "Title", with: "Hi"
		fill_in "Description", with: "This is what I'm doing today."
		click_button "Create Ksat list"

		expect(page).to have_content("error")
		expect(KsatList.count).to eq(0)

		visit "/ksat_lists"
		expect(page).to_not have_content("This is what I'm doing today.")
	end
end