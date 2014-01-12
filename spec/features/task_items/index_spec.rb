require 'spec_helper'

describe "Viewing task items" do
	let!(:ksat_list) { KsatList.create(title: "Proton", description: "Suprima S") }

	it "displays the title of the todo list" do
		visit_ksat_list(ksat_list)
		within("h2") do
			expect(page).to have_content(ksat_list.title)
		end
	end

	it "displays no items when a task list is empty" do
		visit_ksat_list(ksat_list)
		expect(page.all("tr.task_items td").size).to eq(0)
	end

	it "displays item content when a ksat list has items" do
		ksat_list.task_items.create(content: "Proton")
		ksat_list.task_items.create(content: "Perodua")

		visit_ksat_list(ksat_list)

		expect(page.all("tr.task_items td").size).to eq(2)

		within "tr.task_items" do
			expect(page).to have_content("Proton")
			expect(page).to have_content("Perodua")
		end
	end
end