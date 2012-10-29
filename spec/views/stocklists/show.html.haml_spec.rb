require 'spec_helper'

describe "stocklists/show" do
  before(:each) do
    @stocklist = assign(:stocklist, stub_model(Stocklist,
      :symbol => "Symbol",
      :name => "Name",
      :marketcap => "",
      :sector => "Sector",
      :industry => "Industry"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Symbol/)
    rendered.should match(/Name/)
    rendered.should match(//)
    rendered.should match(/Sector/)
    rendered.should match(/Industry/)
  end
end
