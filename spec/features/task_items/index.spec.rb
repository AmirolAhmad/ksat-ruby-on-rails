require 'spec_helper'

describe "Viewing task items" do
	let!(:ksat_list) { KsatList.create(title: "Proton", description: "Suprima S") }
	it "displays no items when a task list is empty" do
		visit "/ksat_lists"
		within "#ksat_list_#{ksat_list.id}" do
			click_link "List Items"
		end
		expect(page).to have_content("TaskItems#index")
	end
end