Given("I am on the homepage") do
    visit '/'
    end

    And ("I want to register as new user") do
     @user = FactoryBot.create :Amember
    end

    Then("I should see a link to sign up") do
    #expect(page).to have_button('Sign up')
    find_link('Sign up', href:"/users/sign_up")
    end

    When ("I click on the sign up link") do
    find_link('Sign up', href:"/users/sign_up").click
    end

    Then ("I should see a form to sign up") do
     expect(page).to have_selector('form#new_user')
    end

    When ("I submit the sign up form") do
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    fill_in 'Password confirmation', with: @user.password_confirmation
    fill_in 'Fullname', with: @user.fullname
    fill_in 'Contactno', with: @user.contactno

    end
    Then ("I should see the homepage") do
        visit '/home/index'
        end
