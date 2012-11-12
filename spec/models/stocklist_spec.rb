require 'spec_helper'

describe Stocklist do
  before(:each) do
    @attr = {
      :symbol => 'AAPL',
      :name => 'Apple Inc', 
      :ipoyear => '1981',
      :marketcap => '514.86B', 
      :sector => 'Technology',
      :industry => 'Computer Hardware'
    }
  end
  
  it 'should create new stock entry' do
    Stocklist.create!(@attr)
  end
  
  it 'should keep stock symbol unique' do
    Stocklist.create(@attr)
    duplicate = Stocklist.new(@attr)
    duplicate.should_not be_valid  
  end
  
  it 'should not accept empty symbol value' do
    empty = Stocklist.new(@attr.merge(:symbol => ""))
    empty.should_not be_valid
  end
end
