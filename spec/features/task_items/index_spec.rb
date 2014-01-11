require 'spec_helper'

describe "Viewing task items" do
	let!(:ksat_list) { KsatList.create(title: "Proton", description: "Suprima S") }

	def visit_ksat_list(list)
		visit "/ksat_lists"
		within "#ksat_list_#{list.id}" do
			click_link "List Items"
		end
	end

	it "displays the title of the todo list" do
		visit_ksat_list(ksat_list)
		within("h1") do
			expect(page).to have_content(ksat_list.title)
		end
	end

	it "displays no items when a task list is empty" do
		visit_ksat_list(ksat_list)
		expect(page.all("ul.task_items li").size).to eq(0)
	end

	it "displays item content when a ksat list has items" do
		ksat_list.task_items.create(content: "Proton")
		ksat_list.task_items.create(content: "Perodua")

		visit_ksat_list(ksat_list)

		expect(page.all("ul.task_items li").size).to eq(2)

		within "ul.task_items" do
			expect(page).to have_content("Proton")
			expect(page).to have_content("Perodua")
		end
	end
end