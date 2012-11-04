Given /^I visit the home page$/ do
  visit "/"
end

Then /^I should see "(.*?)"$/ do |content|
  if page.respond_to? :should
    page.should have_content(content)
  else
    assert page.has_content?(content)
  end
end

Then /^I should see the "(.*?)" link$/ do |link|
  assert page.has_link?(link)
end