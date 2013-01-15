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
