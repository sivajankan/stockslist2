require 'spec_helper'

describe StockFetchController do

  describe "GET 'fetch_data'" do
    it "returns http success" do
      get 'yahoo_data'
      response.should be_success
    end
  end

end
