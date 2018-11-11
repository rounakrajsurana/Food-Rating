Feature: Stall
    As an admin, I want to associate stalls with the owner.
Scenario: Add new stall with specific owner
    An admin should be able to add a stall with specific owner user.

Given I am an admin
And I am logged in
And I want to add a stall

When I visit the stalls page
Then I should see a link for create new stall

When I click the new stall link
Then I should see a form to add a new stall

When I submit a new stall form
Then I should see the details of the new stall