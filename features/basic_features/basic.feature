@selenium
Feature: User can see home page

Scenario: As user I can see home page
Given I visit the home page
Then I should see "Welcome"
And I should see the "Stocklists" link
