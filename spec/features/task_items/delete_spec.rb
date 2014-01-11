require 'spec_helper'

describe "Deleting task items" do
	let!(:ksat_list) { KsatList.create(title: "Proton", description: "Suprima S") }
	let!(:task_item) { ksat_list.task_items.create(content: "Proton") }

	def visit_ksat_list(list)
		visit "/ksat_lists"
		within "#ksat_list_#{list.id}" do
			click_link "List Items"
		end
	end

	it "is successful" do
		visit_ksat_list(ksat_list)
		within("#task_item_#{task_item.id}") do
			click_link "Delete"
		end
		expect(page).to have_content("Task list item was successfully deleted.")
		expect(TaskItem.count).to eq(0)
	end
end