Feature: Register
Scenario: User should be able to register
 Given I am on the homepage
 And I want to register as new user
 Then I should see a link to sign up
 When I click on the sign up link
 Then I should see a form to sign up
 When I submit the sign up form
 Then I should see the homepage