Given("I am an admin") do
  @admin = FactoryBot.create :Aadmin
end

Given("I am logged in") do
  visit '/';
  click_link 'Sign in'
  fill_in 'Email', with: @admin.email
  fill_in 'Password', with: @admin.password
  click_button 'Sign in'
  expect(page).to have_content('successful')
end

When("I visit the user page") do
  visit '/admin/user';
end

Then("I should see recently registered users") do
  expect(page).to have_content('List of Users')
end

Given("I want to ban a user") do
  @member = FactoryBot.build :Amember
  @member.active = false
end

Then("I should see the User successful banned message") do
  expect(page).to have_content('List of Users')
end

Given("I want to add a stall") do

  #pending # Write code here that turns the phrase above into concrete actions
end

When("I visit the stalls page") do
  visit '/stalls'
  #pending # Write code here that turns the phrase above into concrete actions
end

Then("I should see a link for create new stall") do
  expect(page).to have_link('New Stall')
  #pending # Write code here that turns the phrase above into concrete actions
end

When("I click the new stall link") do
  click_link('New Stall')
  #visit '/stalls/new';
end

Then("I should see a form to add a new stall") do
  expect(page).to have_button('Create Stall')
end

When("I submit a new stall form") do
  # @stall = FactoryBot.build :stall
end


Then("I should see the details of the new stall") do
  expect(page).to have_content('Introduction')
end
