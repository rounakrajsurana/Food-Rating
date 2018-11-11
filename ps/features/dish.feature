Feature: Dish
    As a stall, I want to associate dishes with my stall.
Scenario: Add new dish into a stall
    A Stall should be able to add dish into a stall with specific category.

Given I am a stall owner
And I am signed in
And I want to add a dish

When I visit the My Stall page
Then I should see a link to create new dish

When I click the new dish link
Then I should see a form to add a new dish

When I submit the new dish form
Then I should see the details of the new dish
