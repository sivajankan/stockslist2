require 'spec_helper'

describe StockDataFetch do
  before do
    @goog_str = %{"GOOG","Google Inc.",734.75,"1/7/2013","4:00pm","-3.22 - -0.44%",-3.22,"-0.44%",737.97,736.05,739.38,730.58,1655967,"730.58 - 739.38","4:00pm - <b>734.75</b>",2558940,710.00,735.24,736.24}
    
    @goog_basic_str = %{"GOOG","123.45","10","10%","123.45-123.67","Google still exists","123456","NYSE","2000"}
  end
  
  it 'should return stock info for given stock symbol' do
    YahooFinance.stub(:get) {@goog_str}
    res = StockDataFetch.standard_quotes('GOOG')
    res['GOOG'].name.should == 'Google Inc.'
    res['GOOG'].symbol.should == 'GOOG'
    res['GOOG'].volume.should == 1655967
  end
  
  it 'should return stock info in hash ' do
    YahooFinance.stub(:get) {@goog_basic_str}
    StockDataFetch.specialized_quotes('GOOG', YahooFinance::BASICHASH).should == {"GOOG"=>{"symbol"=>"GOOG", "lastTrade"=>"123.45", "change"=>"10", "changeInPercent"=>"10%", "dayRange"=>"123.45-123.67", "name"=>"Google still exists", "marketCap"=>"123456", "stockExchange"=>"NYSE", "aveDailyVol"=>"2000"}}
  end
end
