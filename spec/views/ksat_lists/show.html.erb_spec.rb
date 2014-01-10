require 'spec_helper'

describe "ksat_lists/show" do
  before(:each) do
    @ksat_list = assign(:ksat_list, stub_model(KsatList,
      :title => "Title",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
  end
end
