Feature: Review
    As a member, I want to create review to dishes.
Scenario: Add new review to a dish
    A Member should be able to create rating & reviews belongs to dishes.

Given I am a member
And I am signed in as user

When I visit the dish page
Then I should see the description of dishes
And I should see a link to show the dish 

When I click the show link 
Then I should see a link to add rating   

When I click the add rating link
Then I should see a form to add New review

When I submit the new rating form
Then I should see the reviews
And I should see my review added to the dish 
