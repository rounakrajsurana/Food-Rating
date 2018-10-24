Feature: Admin
    As an admin, I want to associate stalls with the owner.
Scenario: Add new stall with specific owner
    An admin should be able to add a stall with specific owner user.

Given I am an admin
And I am logged in

When I visit the user page
Then I should see recently registered users

And I want to ban a user
When I submit the form
Then I should see the successful message

And I want to add a stall

When I visit the stalls page
Then I should see a link for create new stall

When I click the link
Then I should see a form to add a stall

When I submit the form
Then I should see the details of the new stall
