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
end