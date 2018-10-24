Given("I am an admin") do
  @admin = FactoryBot.create :admin
end

Given("I am logged in") do
  visit '/';
  click_link 'Sign in'
  fill_in 'Email', with: @admin.email
  fill_in 'Password', with: @admin.password
  click_button 'Log in'
end

When("I visit the user page") do
  visit '/admin/user';
end

Then("I should see recently registered users") do
  expect(page).to have_content('List of Users')
end

Given("I want to ban a user") do
  @member = FactoryBot.build :member
  @member.active = false
end

When("I submit the form") do

end

Then("I should see the successful message") do
  expect(page).to have_content('User successfully updated')
end

Given("I want to add a stall") do
  pending # Write code here that turns the phrase above into concrete actions
end

When("I visit the stalls page") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I should see a link for create new stall") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I should see a form to add a stall") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I should see the details of the new stall") do
  pending # Write code here that turns the phrase above into concrete actions
end
