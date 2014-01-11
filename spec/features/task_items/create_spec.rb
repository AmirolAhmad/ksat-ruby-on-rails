require 'spec_helper'

describe "Adding task items" do
	let!(:ksat_list) { KsatList.create(title: "Proton", description: "Suprima S") }

	def visit_ksat_list(list)
		visit "/ksat_lists"
		within "#ksat_list_#{list.id}" do
			click_link "List Items"
		end
	end

	it "is successful with valid content" do
		visit_ksat_list(ksat_list)
		click_link "New Task Item"
		fill_in "Content", with: "Proton"
		click_button "Save"
		
		expect(page).to have_content("Added task list item.")
		within("ul.task_items") do
			expect(page).to have_content("Proton")
		end
	end

	it "displays an error with no content" do
		visit_ksat_list(ksat_list)
		click_link "New Task Item"
		fill_in "Content", with: ""
		click_button "Save"
		within("div.flash") do
			expect(page).to have_content("There was a problem adding that task list item.")
		end

		expect(page).to have_content("Content can't be blank")
	end

	it "displays and error with content less than 2 characters long" do
		visit_ksat_list(ksat_list)
		click_link "New Task Item"
		fill_in "Content", with: "1"
		click_button "Save"
		within("div.flash") do
			expect(page).to have_content("There was a problem adding that task list item.")
		end

		expect(page).to have_content("Content is too short")
	end
end