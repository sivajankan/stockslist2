require 'spec_helper'

describe "stocklists/edit" do
  before(:each) do
    @stocklist = assign(:stocklist, stub_model(Stocklist,
      :symbol => "MyString",
      :name => "MyString",
      :marketcap => "",
      :sector => "MyString",
      :industry => "MyString"
    ))
  end

  it "renders the edit stocklist form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => stocklists_path(@stocklist), :method => "post" do
      assert_select "input#stocklist_symbol", :name => "stocklist[symbol]"
      assert_select "input#stocklist_name", :name => "stocklist[name]"
      assert_select "input#stocklist_marketcap", :name => "stocklist[marketcap]"
      assert_select "input#stocklist_sector", :name => "stocklist[sector]"
      assert_select "input#stocklist_industry", :name => "stocklist[industry]"
    end
  end
end
