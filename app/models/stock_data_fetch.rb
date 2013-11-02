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
    begin 
      return "http://www.google.com#{MarketBeat.chart_url(symbol)}"
    rescue Exception => exp
      Rails.logger.info("SYMBOL: #{symbol}. ERROR: #{exp.to_s}")
    end
    #return "/images/no_chart_available.gif?"
    return "http://www.google.com/finance/chart?q=#{symbol.upcase}"
  end
  
  def self.small_img_params
    "chs=327x180&p=1d"
  end
  
  def self.fancy_img_params
    "chsc=3&chs=490x270&p=1d"
  end
end

class SpecializedQuote < YahooFinance::BaseQuote
  require 'yahoofinance'
  def initialize( hash, valarray=nil )
    super( hash, valarray )
  end
end
