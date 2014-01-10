require 'spec_helper'

describe "Creating ksat lists" do
	def create_task_list(options={})
		options[:title] ||= "My task list"
		options[:description] ||= "This is my task list."

		visit "/ksat_lists"
		click_link "New Ksat list"
		expect(page).to have_content("New ksat_list")

		fill_in "Title", with: options[:title]
		fill_in "Description", with: options[:description]
		click_button "Create Ksat list"
	end

	it "redirects to the ksat list index page on success" do
		create_task_list
		expect(page).to have_content("My task list")
	end

	it "displays an error when the task list has no title" do
		expect(KsatList.count).to eq(0)

		create_task_list title: ""

		expect(page).to have_content("error")
		expect(KsatList.count).to eq(0)

		visit "/ksat_lists"
		expect(page).to_not have_content("This is what I'm doing today.")
	end

	it "displays an error when the task list has a title less than 3 characters" do
		expect(KsatList.count).to eq(0)

		create_task_list title: "Hi"

		expect(page).to have_content("error")
		expect(KsatList.count).to eq(0)

		visit "/ksat_lists"
		expect(page).to_not have_content("This is what I'm doing today.")
	end

	it "displays an error when the task list has no description" do
		expect(KsatList.count).to eq(0)

		create_task_list title: "Suprima S", description: ""

		expect(page).to have_content("error")
		expect(KsatList.count).to eq(0)

		visit "/ksat_lists"
		expect(page).to_not have_content("Suprima S")
	end

	it "displays an error when the task list has a description less than 5 characters" do
		expect(KsatList.count).to eq(0)

		create_task_list title: "Suprima S", description: "Car"

		expect(page).to have_content("error")
		expect(KsatList.count).to eq(0)

		visit "/ksat_lists"
		expect(page).to_not have_content("Suprima S")
	end
end