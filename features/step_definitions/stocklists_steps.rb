Given /^there is a stock entry$/ do
  Fabricate(:stocklist, symbol: 'A1', name: 'A1 Inc')
end

When /^I am on the stocklist page$/ do
  visit('/stocklists')
end

Then /^I should see no stock entry listed$/ do
  all("table tr").count.should == 0
end