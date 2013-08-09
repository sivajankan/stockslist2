module BasicSteps
  def wait_until_all_ajax_requests_complete
    sleep(1) until page.evaluate_script('$.active') == 0
  end 
end
World(BasicSteps)

Given /^I visit the home page$/ do
  visit "/"
end

Then /^I should( not)? see "([^"]*)"$/ do |negate, content|
   negate ? (page.should_not have_content(content)) : (page.should have_content(content))
end

Then /^I should see the "([^"]*)" link$/ do |link|
  assert page.has_link?(link)
end

When /^(?:|I )wait (\d+) seconds?$/ do |seconds|
  sleep seconds.to_i
end

When /^(?:|I )wait until all Ajax requests are complete$/ do
  wait_until_all_ajax_requests_complete
end

Then 'I debug' do
  require 'ruby-debug'; Debugger.start; Debugger.settings[:autoeval] = 1; Debugger.settings[:autolist] = 1; debugger
  $cucumber_debugged = true
end