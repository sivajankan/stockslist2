module StocklistsHelper
  def show_ipoyear(datestr)
    datestr.nil? ? nil : Date.parse(datestr.to_s).year
  end
  
  def fetch_url(url)
    r = Net::HTTP.get_response( URI.parse( url ) )
    if r.is_a? Net::HTTPSuccess
      r.body
    else
      '<p> No data fetched</p>'
    end
  end
  
  def listed_exchanges 
    ['NYSE', 'NASDAQ', 'AMEX']
  end

end
