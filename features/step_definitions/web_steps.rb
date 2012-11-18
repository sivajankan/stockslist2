Given /^I am on the home page$/ do
  visit('/')
end

When /^(?:|I) follow the "(.*?)" link$/ do |link|
  click_link(link)
end

When /^I click the "(.*?)" button$/ do |button_text|
  click_button button_text
end

Then /^I have entered "(.*?)" into the "(.*?)" field$/ do |value, field|
  fill_in field, :with => value
end

Then /^I have selected "(.*?)" from "(.*?)" dropdown list$/ do |option, field|
  select(option, :from => field)
end

When /^I click on "(.*?)" link in the first stock$/ do |link|
  click_link(link)
end

When /^I confirm the dialog$/ do
  page.driver.browser.switch_to.alert.accept
end

When /^I dismissed the dialog$/ do
  page.driver.browser.switch_to.alert.dismiss
end