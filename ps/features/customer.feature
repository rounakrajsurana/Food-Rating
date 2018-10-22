Given I am an admin
And there is an ordinary user
And I am logged in
And I want to add an account owned by the user
When I visit the accounts page
Then I should see a "New account" link
When I click the "New account" link
Then I should see a new account form
When I fill in the account data
Then I should see the new account
And I should see that it is owned by the user