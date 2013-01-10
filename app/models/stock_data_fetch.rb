class StockDataFetch
  require 'yahoofinance'
  
  def self.standard_quotes(symbols)
    YahooFinance.get_standard_quotes(symbols)
  end
  
  def self.specialized_quotes(symbols, hash)
    YahooFinance.get_specialized_quotes(symbols, hash)
  end
end

class StockGoogleGraph
  require 'market_beat'
  
  def self.get_google_graph_url(symbol)
    "http://www.google.com/#{MarketBeat.chart_url(symbol)}"
  end
end

class SpecializedQuote < YahooFinance::BaseQuote
  require 'yahoofinance'
  def initialize( hash, valarray=nil )
    super( hash, valarray )
  end
end

module YahooFinance
  BASICHASH = {
    "s" => [ "symbol", "val" ],
    "l1" => [ "lastTrade", "val.to_f" ],
    "c1" => [ "change", "val" ],
    "p2" => [ "changeInPercent", "val" ],
    "m" => [ "dayRange", "val" ],
    "n" => [ "name", "val" ],
    "j1" => [ "marketCap", "convert(val)" ],
    "x" => [ "stockExchange", "val" ],
    "a2" => [ "aveDailyVol", "val" ] 
    #"v" => ["moreInfo", "val"],
    #"n4" => ["notes", "val"]
  }
  
  PRICEHASH = {
    "s" => [ "symbol", "val" ],
    "h" => [ "dayHigh", "val" ],
    "g" => [ "dayLow", "val" ],
    "t8" => [ "oneYearTargetPrice", "val" ],
    "a" => [ "ask", "val" ],
    "b" => [ "bid", "val" ],
    "p" => [ "previousClose", "val" ],
    "o" => [ "open", "val" ],
    "c" => [ "changeAndPercentChange", "val" ],
    "c3" => [ "commission", "val" ],
    "l" => [ "lastTradeWithTime", "val" ],
    "w1" => [ "dayValueChange", "val" ]
  }
  
  MARKETOPENHASH = {
    "s" => [ "symbol", "val" ],
    "b2" => [ "askRealTime", "val" ],
    "b3" => [ "bidRealtime", "val" ],
    "c6" => [ "changeRealtime", "val" ],
    "k2" => [ "changePercentRealtime", "val" ],
    "c8" => [ "afterHoursChangeRealtime", "val" ],
    "k1" => [ "lastTradeRealtimeWithTime", "val" ],
    "w4" => [ "dayValueChangeRealtime", "val" ],
    "m2" => [ "dayRangeRealtime", 'val'],
    "j3" => [ "marketCapRealTime", "convert(val)" ],
  }
  
  DATEHASH = {
    "s" => [ "symbol", "val" ],
    "d1" => [ "lastTradeDate", "val" ],
    #"d2" => [ "tradeDate", "val" ],
    "t1" => [ "lastTradeTime", "val"]
  }
  
  RATIOHASH = {
    "s" => [ "symbol", "val" ],
    "e" => [ "earningsPerShare", "val.to_f" ],
    "e7" => [ "epsEstimateCurrentYear", "val" ],
    "e8" => [ "epsEstimateNextYear", "val" ],
    "e9" => [ "epsEstimateNextQuarter", "val" ],
    "r" => [ "peRatio", "val.to_f" ],
    "s7" => [ "shortRatio", "val" ],
    "r5" => [ "pegRatio", "val.to_f" ],
    "b4" => [ "bookValue", "val.to_f" ],
    "p6" => [ "pricePerBook", "val.to_f" ],
    "p5" => [ "pricePerSales", "val.to_f" ],
    "j4" => [ "ebitda", "val" ],
    "r6" => [ "pricePerEPSEstimateCurrentYear", "val" ],
    "r7" => [ "pricePerEPSEstimateNextYear", "val" ]
  }
  
  DIVIDENDHASH = {
    "s" => [ "symbol", "val" ],
    "d" => [ "dividendPerShare", "convert(val)" ],
    "y" => [ "dividendYield", "convert(val)" ],
    "r1" => [ "dividendPayDate", "val" ],
    "q" => [ "exDividendDate", "val" ],
  }
  
  WEEKS52 = {
    "s" => [ "symbol", "val" ],
    "w" => [ "weeks52Range", "val" ],
    "k" => [ "weeks52High", "val" ],
    "j" => [ "weeks52Low", "val" ],
    "j5" => [ "weeks52ChangeFromLow", "val.to_f" ],
    "j6" => [ "weeks52ChangePercentFromLow", "val" ],
    "k4" => [ "weeks52ChangeFromHigh", "val.to_f" ],
    "k5" => [ "weeks52ChangePercentFromHigh", "val" ]
  }
  
  
  VOLUMEHASH = {
    "s" => [ "symbol", "val" ],
    "a5" => [ "askSize", "val" ],
    "b6" => [ "bidSize", "val" ],
    "k3" => [ "lastTradeSize", "val" ],
    "a2" => [ "aveDailyVol", "val" ] 
  }
  
  MOVINGAVE = {
    "s" => [ "symbol", "val" ],
    "m3" => [ "movingAve50days", "val" ],
    "m7" => [ "movingAve50daysChangeFrom", "val" ],
    "m8" => [ "movingAve50daysChangePercentFrom", "val" ],
    "m4" => [ "movingAve200days", "val" ],
    "m5" => [ "movingAve200daysChangeFrom", "val" ],
    "m6" => [ "movingAve200daysChangePercentFrom", "val" ]
  }
  
  ALLDATAHASH = {
    "s" => [ "symbol", "val" ],
    "l1" => [ "lastTrade", "val.to_f" ],
    "n" => [ "name", "val" ],
    "w" => [ "weeks52Range", "val" ],
    "j5" => [ "weeks52ChangeFromLow", "val.to_f" ],
    "j6" => [ "weeks52ChangePercentFromLow", "val" ],
    "k4" => [ "weeks52ChangeFromHigh", "val.to_f" ],
    "k5" => [ "weeks52ChangePercentFromHigh", "val" ],
    "e" => [ "earningsPerShare", "val.to_f" ],
    "r" => [ "peRatio", "val.to_f" ],
    "s7" => [ "shortRatio", "val" ],
    "r1" => [ "dividendPayDate", "val" ],
    "q" => [ "exDividendDate", "val" ],
    "d" => [ "dividendPerShare", "convert(val)" ],
    "y" => [ "dividendYield", "convert(val)" ],
    "j1" => [ "marketCap", "convert(val)" ],
    "t8" => [ "oneYearTargetPrice", "val" ],
    "e7" => [ "epsEstimateCurrentYear", "val" ],
    "e8" => [ "epsEstimateNextYear", "val" ],
    "e9" => [ "epsEstimateNextQuarter", "val" ],
    "r6" => [ "pricePerEPSEstimateCurrentYear", "val" ],
    "r7" => [ "pricePerEPSEstimateNextYear", "val" ],
    "r5" => [ "pegRatio", "val.to_f" ],
    "b4" => [ "bookValue", "val.to_f" ],
    "p6" => [ "pricePerBook", "val.to_f" ],
    "p5" => [ "pricePerSales", "val.to_f" ],
    "j4" => [ "ebitda", "val" ],
    "m3" => [ "movingAve50days", "val" ],
    "m7" => [ "movingAve50daysChangeFrom", "val" ],
    "m8" => [ "movingAve50daysChangePercentFrom", "val" ],
    "m4" => [ "movingAve200days", "val" ],
    "m5" => [ "movingAve200daysChangeFrom", "val" ],
    "m6" => [ "movingAve200daysChangePercentFrom", "val" ],
    "s1" => [ "sharesOwned", "val" ],
    "p1" => [ "pricePaid", "val" ],
    "c3" => [ "commission", "val" ],
    "v1" => [ "holdingsValue", "val" ],
    "w1" => [ "dayValueChange", "val" ],
    "g1" => [ "holdingsGainPercent", "val" ],
    "g4" => [ "holdingsGain", "val" ],
    "d2" => [ "tradeDate", "val" ],
    "g3" => [ "annualizedGain", "val" ], 
    "l2" => [ "highLimit", "val" ],
    "l3" => [ "lowLimit", "val" ],
    "n4" => [ "notes", "val" ],
    "x" => [ "stockExchange", "val" ]
  }

  def YahooFinance.get_specialized_quotes( symbols, hash )
    csvquotes = YahooFinance::get( symbols, hash.keys.join )
    ret = Hash.new
    CSV.parse( csvquotes ) do |row|
      qt = SpecializedQuote.new( hash, row )
      ohash = Hash.new
      hash.keys.each_with_index {|key, idx| ohash[hash[key][0]]=row[idx]}
      ret[qt.symbol] = ohash
    end
    ret
  end

end