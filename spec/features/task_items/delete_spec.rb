require 'spec_helper'

describe "Deleting task items" do
	let!(:ksat_list) { KsatList.create(title: "Proton", description: "Suprima S") }
	let!(:task_item) { ksat_list.task_items.create(content: "Proton") }

	it "is successful" do
		visit_ksat_list(ksat_list)
		within("#task_item_#{task_item.id}") do
			click_link "Delete"
		end
		expect(page).to have_content("Task list item was successfully deleted.")
		expect(TaskItem.count).to eq(0)
	end
end