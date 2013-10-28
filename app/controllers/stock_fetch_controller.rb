class StockFetchController < ApplicationController
  
  def yahoo_data
    @symbol = params[:yahoo_symbol]
    @group = params[:group]
    @hashlist = nil
    if @group == '2'
      @hashlist = [YahooFinance::RATIOHASH, YahooFinance::DIVIDENDHASH, YahooFinance::WEEKS52, YahooFinance::MOVINGAVE]
    else
      @hashlist = [YahooFinance::BASICHASH, YahooFinance::PRICEHASH, YahooFinance::MARKETOPENHASH, YahooFinance::DATEHASH, YahooFinance::VOLUMEHASH]
    end
    respond_to do |format|
      format.html # fetch_data.html.haml
      format.json { render json: @hashlist }
    end
  end
  
  def yahoo_short_info
    @symbol = params[:yahoo_symbol]
    @hashlist = [YahooFinance::SHORTINFO]
    @result = StockDataFetch.specialized_quotes(@symbol, @hashlist.first)
    respond_to do |format|
      format.html { render "yahoo_data" }
      format.json { render json: @result }
    end    
  end
  
  def yahoo_info
    render :layout => "home"
  end
end
