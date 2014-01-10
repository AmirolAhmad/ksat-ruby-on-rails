require 'spec_helper'

describe "Editing task lists" do
	let!(:ksat_list) { ksat_list = KsatList.create(title: "Proton", description: "Suprima S.") }

	def update_task_list(options={})
		options[:title] ||= "My task list"
		options[:description] ||= "This is my task list."
		ksat_list = options[:ksat_list]

		visit "/ksat_lists"
		within "#ksat_list_#{ksat_list.id}" do
			click_link "Edit"
		end

		fill_in "Title", with: options[:title]
		fill_in "Description", with: options[:description]
		click_button "Update Ksat list"
	end

	it "updates a task list successfully with correct information" do
		update_task_list ksat_list: ksat_list,
										 title: "New title",
										 description: "New description"

		ksat_list.reload

		expect(page).to have_content("Ksat list was successfully updated.")
		expect(ksat_list.title).to eq("New title")
		expect(ksat_list.description).to eq("New description")
	end

	it "displays an error with no title" do
		update_task_list ksat_list: ksat_list, title: ""
		title = ksat_list.title
		ksat_list.reload
		expect(ksat_list.title).to eq(title)
		expect(page).to have_content("error")
	end

	it "displays an error with too short a title" do
		update_task_list ksat_list: ksat_list, title: "Hi"
		expect(page).to have_content("error")
	end

	it "displays an error with no description" do
		update_task_list ksat_list: ksat_list, description: ""
		expect(page).to have_content("error")
	end

	it "displays an error with too short a description" do
		update_task_list ksat_list: ksat_list, description: "Hi"
		expect(page).to have_content("error")
	end
end