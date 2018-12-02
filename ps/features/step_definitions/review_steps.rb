Given("I am a member") do
  @member = FactoryBot.create :Amember1
end

Given("I am signed in as user") do
  visit '/';
  click_link 'Sign in'
  fill_in 'Email', with: @member.email
  fill_in 'Password', with: @member.password
  click_button 'Sign in'
end

When("I visit the dish page") do
  visit '/dishes';
end

Then("I should see the description of dishes") do
  #save_and_open_page
  expect(page).to have_content ('Dish ID')
  expect(page).to have_content ('Name')
  expect(page).to have_content('Description')
  expect(page).to have_content('Details')
  #pending # Write code here that turns the phrase above into concrete actions
end

Then("I should see a link to show the dish") do
  # not able to identify among so many links for show
  #expect(page).to have_link('Show')
  expect(page).to have_link('Show', href: dish_path(dish))
  #pending # Write code here that turns the phrase above into concrete actions
end

When("I click the show link") do
  find_link('Show', href: dish_path(@dish)).click
  # pending # Write code here that turns the phrase above into concrete actions
end

Then("I should see a link to add rating") do
  expect(page).to have_button('Add Rating')
  #pending # Write code here that turns the phrase above into concrete actions
end

When("I click the add rating link") do
  visit '/dishes/id/ratings/new';
end

Then("I should see a form to add New review") do
  expect(page).to have_button('Create Rating')
end

When("I submit the new rating form") do
  visit '/dishes/id';
end

Then("I should see the reviews") do
  expect(page).to have_content('Ratings&Reviews')

end

Then("I should see my review added to the dish") do
  pending # Write code here that turns the phrase above into concrete actions
end
