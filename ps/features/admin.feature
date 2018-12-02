Feature: Admin
    As an admin, I want to ban users from doing any tasks in the application.
Scenario: Banning a user from doing anything
    An admin should be able to ban a user.

Given I am an admin
And I am logged in

When I visit the user page
Then I should see recently registered users

When I want to ban a user
Then I should see the User successful banned message
