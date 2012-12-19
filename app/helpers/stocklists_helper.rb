module StocklistsHelper
  def show_ipoyear(datestr)
    datestr.nil? ? nil : Date.parse(datestr.to_s).year
  end
end
