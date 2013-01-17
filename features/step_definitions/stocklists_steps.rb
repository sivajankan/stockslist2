Given /^there is a stock entry$/ do
  Fabricate(:stocklist, symbol: 'A1', name: 'A1 Inc', ipoyear: '1991-01-01')
end

When /^I am on the stocklist page$/ do
  visit('/stocklists')
end

Then /^I should see no stock entry listed$/ do
  all("table tbody tr").count.should == 0
end