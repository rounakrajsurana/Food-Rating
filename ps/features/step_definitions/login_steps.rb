Given("I am on the home page") do
    visit '/'
   end
   And ("I want to sign in") do
    @user = FactoryBot.create :member
   end
   Then("I should see a link to sign in") do
    find_link('Sign in', href:"/users/sign_in")
   end
   When ("I click on the link to sign in") do
    find_link('Sign in', href:"/users/sign_in").click
   end
   Then ("I should see a form to sign in") do
    expect(page).to have_selector('form#new_user')
   end
   When ("I submit the sign in form") do
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
   end

   Then ("I should be on the users home page") do
    visit '/home/index'
   end