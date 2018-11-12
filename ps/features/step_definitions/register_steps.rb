Given(/^I am on the homepage$/) do
    visit '/'
    end
    
    And (/^I am not signed up$/) do
     @user = FactoryBot.create :user
    end
    
    Then(/^I should see a link to sign up$/) do
    find_link('Sign up', href:"/users/sign_up")
    end
    
    When (/^I click on the sign up link$/) do
    find_link('Sign up', href:"/users/sign_up").click
    end
    
    Then (/^I should see a sign up form to fill$/) do
     expect(page).to have_selector('form#new_user')
    end

    When (/^I submit the sign up form$/) do
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
     fill_in 'Password confirmation', with: @user.password_confirmation
    end
    Then (/^I should see the homepage$/) do
        visit root_path
        end