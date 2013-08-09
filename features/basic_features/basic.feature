#@selenium
Feature: User can see home page

Scenario: As user I can see home page
  Given I visit the home page
   Then I should see "Stockslist"
    And I should see "Home"
    And I should see "YahooInfo"
    And I should see "Login"
    And I should see "Sign up"

@wip
Scenario: As I valid user I can see home page
  Given I visit the home page
   Then I should see "Stockslist"
    And I should see "Welcome"