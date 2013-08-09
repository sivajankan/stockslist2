@selenium
Feature: Exploring options available during sign in 
     And user can see yahoo info option without sign in
     
@pause
Scenario: As user I can see home page
  Given I visit the home page
   Then I should see "Stockslist"
    And I should see "Home"
    And I should not see "StockIndex"
    And I should see "YahooInfo"
    And I should see "You need to sign in or sign up before continuing."
    And I should see "Sign in"
    And I should see "Email"
    And I should see "Password"
    And I should see "Remember me"
    And I should see "Sign up"
    And I should see "Forgot your password"
