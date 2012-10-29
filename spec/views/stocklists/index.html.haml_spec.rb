require 'spec_helper'

describe "stocklists/index" do
  before(:each) do
    assign(:stocklists, [
      stub_model(Stocklist,
        :symbol => "Symbol",
        :name => "Name",
        :marketcap => "",
        :sector => "Sector",
        :industry => "Industry"
      ),
      stub_model(Stocklist,
        :symbol => "Symbol",
        :name => "Name",
        :marketcap => "",
        :sector => "Sector",
        :industry => "Industry"
      )
    ])
  end

  it "renders a list of stocklists" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Symbol".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Sector".to_s, :count => 2
    assert_select "tr>td", :text => "Industry".to_s, :count => 2
  end
end
