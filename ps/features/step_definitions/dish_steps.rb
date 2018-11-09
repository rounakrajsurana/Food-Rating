Given("I am a stall") do
  @stall = FactoryBot.create :stall
end

Given("I am signed in") do
  visit '/';
  click_link 'Sign in'
  fill_in 'Email', with: @stall.email
  fill_in 'Password', with: @stall.password
  click_button 'Sign in'
end

Given("I want to add a dish") do
  visit '/dishes';
  click_link 'New Dish'
  # fill_in 'Email', with: @stall.email
  # fill_in 'Password', with: @stall.password
end

When("I visit the My Stall page") do
    visit '/stall/1';
end

Then("I should see a link for create new dish") do
  expect(page).to have_content('Create Dish')
end

When("I click the link") do
  visit '/dishes/new';
end

Then("I should see a form to add a dish") do
  expect(page).to have_content('Create Dish')
end

When("I submit the form") do
  click_button 'Create Dish'
end

Then("I should see the details of the new dish") do
  expect(page).to have_content('Dish was successfully created.')
  expect(page).to have_content('Description')
end
