require 'spec_helper'

describe "Editing task items" do
	let!(:ksat_list) { KsatList.create(title: "Proton", description: "Suprima S") }
	let!(:task_item) { ksat_list.task_items.create(content: "Proton") }

	it "is successful with valid content" do
		visit_ksat_list(ksat_list)
		within("#task_item_#{task_item.id}") do
			click_link "Edit"
		end
		fill_in "Content", with: "Lots of Proton"
		click_button "Save"
		expect(page).to have_content("Saved task list item.")
		task_item.reload
		expect(task_item.content).to eq("Lots of Proton")
	end

	it "is unsuccessful with no content" do
		visit_ksat_list(ksat_list)
		within("#task_item_#{task_item.id}") do
			click_link "Edit"
		end
		fill_in "Content", with: ""
		click_button "Save"
		expect(page).to_not have_content("Saved task list item.")
		expect(page).to have_content("Content can't be blank")
		task_item.reload
		expect(task_item.content).to eq("Proton")
	end

	it "is unsuccessful with not enough content" do
		visit_ksat_list(ksat_list)
		within("#task_item_#{task_item.id}") do
			click_link "Edit"
		end
		fill_in "Content", with: "1"
		click_button "Save"
		expect(page).to_not have_content("Saved task list item.")
		expect(page).to have_content("Content is too short")
		task_item.reload
		expect(task_item.content).to eq("Proton")
	end
end