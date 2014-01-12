require 'spec_helper'

describe TaskItem do
  it { should belong_to(:ksat_list) }

  describe "#completed?" do
  	let(:task_item) { TaskItem.create(content: "Hello") }

  	it "is false when completed_is blank" do
  		task_item.completed_at = nil
  		expect(task_item.completed?).to be_false
  	end

  	it "returns true when completed_at is not empty" do
  		task_item.completed_at = Time.now
  		expect(task_item.completed?).to be_true
  	end
  end
end
