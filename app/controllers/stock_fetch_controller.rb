class StockFetchController < ApplicationController
  def fetch_data
    @fetched = "SUCCESSFUL AJAX 123"
    #debugger
    @symbol = params[:symbol]
    respond_to do |format|
      format.html # fetch_data.html.haml
      format.json { render json: @fetched }
    end
  end
end
