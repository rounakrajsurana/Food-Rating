Feature: Review
    As a member, I want to create review to dishes.
Scenario: Add new review to a dish
    A Member should be able to create rating & reviews belongs to dishes.

Given I am a Member
And I am signed in
And I want to create a review

When I visit the a dish page
Then I should see a link for create a review

When I click the link
Then I should see a form to add a review

When I submit the form
Then I should see the details of my review
