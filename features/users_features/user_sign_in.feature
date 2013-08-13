Feature: Exploring options available during sign in 
     And user can see yahoo info option without sign in

Scenario: As a user I can see home page without logging
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

Scenario: As a user I can update my info
  Given I exist as a user
   And I am not logged in
  When I sign in with valid credentials
  Then I see a successful sign in message
  When I return to the site
  Then I should be signed in
  When I follow the "EditAccount" link
   And I update user info
   And I click the "Update" button
  Then I should see "You updated your account successfully."
   