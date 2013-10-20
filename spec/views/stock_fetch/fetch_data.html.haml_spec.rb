require 'spec_helper'

describe "stock_fetch/fetch_data.html.haml" do
  it 'returns first part of yahoo finance info' do
    visit "#{stock_fetch_yahoo_data_path}?symbol=A"
    #save_and_open_page
    assert page.has_content?('Last Trade')
  end
  
  it 'returns second part of yahoo finance info' do
    visit "#{stock_fetch_yahoo_data_path}?symbol=A&group=2"
    assert page.has_content?('EPS')
    assert page.has_xpath?('//img')
  end
end
