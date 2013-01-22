class StockFetchController < ApplicationController
  def fetch_data
    @symbol = params[:symbol]
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
end
