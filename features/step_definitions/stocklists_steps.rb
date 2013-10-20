Given /^there is a stock entry$/ do
  Fabricate(:stocklist, symbol: 'A1', name: 'A1 Inc', ipoyear: '1991-01-01')
end

When /^I am on the stocklist page$/ do
  visit('/stocklists')
end

Then /^I should see no stock entry listed$/ do
  all("ul li").count.should == 0
end

Then /^I can verify google stock graph image updated based on period selection:$/ do |table|
  table.raw.flatten.each do |period|
    step %{I click on "#{period}" cell inside the "period_selection" table}
    step %{I wait 1 second}
    step %{I should see "#{period}" period google stock graph image}
  end
end

Then(/^I can verify google stock graph image updated based on period selection inside the fancy box:$/) do |table|
  table.raw.flatten.each do |period|
    step %{I click on "#{period}" cell inside the "period_selection" table inside the fancy box}
    step %{I wait 1 second}
    step %{I should see "#{period}" period google stock graph image inside the fancy box}
  end
end