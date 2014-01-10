require 'spec_helper'

describe "ksat_lists/edit" do
  before(:each) do
    @ksat_list = assign(:ksat_list, stub_model(KsatList,
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit ksat_list form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", ksat_list_path(@ksat_list), "post" do
      assert_select "input#ksat_list_title[name=?]", "ksat_list[title]"
      assert_select "textarea#ksat_list_description[name=?]", "ksat_list[description]"
    end
  end
end
