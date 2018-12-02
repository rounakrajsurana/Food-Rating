Given("I am a stall owner") do
  @stall = FactoryBot.create :Astall
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
    visit '/dishes';
end

Then("I should see a link to create new dish") do
  expect(page).to have_link('New Dish')
end

When("I click the new dish link") do
  visit '/dishes/new';
end

Then("I should see a form to add a new dish") do
  expect(page).to have_button('Create Dish')
end

When("I submit the new dish form") do
  #@dish = FactoryBot.build :dish

end

Then("I should see the details of the new dish") do
  # expect(page).to have_content('Dish was successfully created.')
  expect(page).to have_content('Description')
end
