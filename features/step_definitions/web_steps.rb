module WithinLocator

    def find_row_xpath(search_str)
      xpath = "//td//a[contains(.,\"#{search_str}\")]/../../.."
    end
    
    def within_first(xpath, visible = true)
      within(page.first(:xpath, xpath, :visible => visible)) do
        yield
      end
    end

    def with_scope(locator)
      locator ? within(*selector_for(locator)) { yield } : yield
    end
    
end

World(WithinLocator)

# Single-line step scoper
When /^(.*) inside ([^:]+)$/ do |step_def, parent|
  with_scope(parent) { step step_def }
end

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

When /^I click on "([^"]*)" link$/ do |link|
  click_link(link)
end

When /^I click on "([^"]*)" cell$/ do |cell|
  find("td[text()='#{cell}']").click
end

When /^I confirm the dialog$/ do
  page.driver.browser.switch_to.alert.accept
end

When /^I dismissed the dialog$/ do
  page.driver.browser.switch_to.alert.dismiss
end

When /^I click on "([^"]*)" icon in the first stock$/ do |id|
  page.find(:xpath, "//a[contains(@class,'icon-#{id}')]").click
end

Then /^(?:|I )should see "([^"]*)" image$/ do |image|
  page.should have_selector("img[src*=#{image}]")
end

Then /^(?:|I )click the "([^"]*)" image$/ do |image|
  #debugger
  page.find(:xpath, "//img[contains(@src, 'closebox')]").click
end

Then /^I should see google stock graph image of "([^"]*)"$/ do |symbol|
  img_url = StockGoogleGraph.get_google_graph_url(symbol)
  page.should have_selector("img[src*='#{img_url}']")
end

Then /^I should see "([^"]*)" period google stock graph image$/ do |period|
  page.should have_selector("img[src*='p=#{period}']")
end

When /^I click on the google stock graph image$/ do
  page.find(:xpath, "//img[contains(@src,'www.google.com/finance/chart')]").click
end

Then /^I should not see the fancy box$/ do
  page.first(:xpath, "//div[@id='zoom']").should be_nil
end
