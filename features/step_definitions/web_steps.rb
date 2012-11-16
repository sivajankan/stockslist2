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
