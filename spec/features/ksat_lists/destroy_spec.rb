require 'spec_helper'

describe "Deleting task lists" do
	let!(:ksat_list) { ksat_list = KsatList.create(title: "Proton", description: "Suprima S.") }

	it "is successful when clicking the destroy link" do
		visit "/ksat_lists"

		within "#ksat_list_#{ksat_list.id}" do
			click_link "Delete"
		end
		expect(page).to_not have_content(ksat_list.title)
		expect(KsatList.count).to eq(0)
	end
end