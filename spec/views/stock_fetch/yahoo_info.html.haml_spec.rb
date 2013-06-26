require 'spec_helper'
require 'javascript'

describe "stock_fetch/yahoo_info" do
  it 'should show yahoo info for given symbol', :js => true do
    visit stock_fetch_yahoo_info_path
    page.should have_content 'Yahoo Info'
    fill_in 'Symbol', :with => 'A'
    #trigger_change_event_for_input('Symbol')
    trigger_key_event('Symbol', 'tab')
    sleep(3)
    page.should have_content 'Last Trade'
    page.should have_content 'EPS'
  end
end
