Given("I am an Admin") do
  @admin = FactoryBot.create :admin
end

Given("I am logged in") do
  visit '/users/sign_in';
  click_link 'Log in'
  fill_in 'Email', with: @admin.email
  fill_in 'Password', with: @admin.password
  click_button 'Log in'
end






Given("I want to add a stall") do

end

When("I visit the stalls page") do
  visit '/users/sign_in';
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
