require 'spec_helper'

describe "Completing task items" do
	let!(:ksat_list) { KsatList.create(title: "Proton", description: "Suprima S") }
	let!(:task_item) { ksat_list.task_items.create(content: "Proton") }

	it "is successful when marking a single item complete" do
		expect(task_item.completed_at).to be_nil
		visit_ksat_list ksat_list
		within dom_id_for(task_item) do
			click_link "Mark as Complete"
		end
		task_item.reload
		expect(task_item.completed_at).to_not be_nil
	end

	context "with completed items" do
	  let!(:completed_task_item) { ksat_list.task_items.create(content: "Proton", completed_at: 5.minutes.ago) }

	  it "shows completed items as complete" do
	  	visit_ksat_list ksat_list
	  	within dom_id_for(completed_task_item) do
	  		expect(page).to have_content(completed_task_item.completed_at)
	  	end
	  end

	  it "does not give the option to mark complete" do
	  	visit_ksat_list ksat_list
	  	within dom_id_for(completed_task_item) do
	  		expect(page).to_not have_content("Mark as Complete")
	  	end
	  end
	end

end