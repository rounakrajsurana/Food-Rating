require "application_system_test_case"

class LogRatingsTest < ApplicationSystemTestCase
  setup do
    @log_rating = log_ratings(:one)
  end

  test "visiting the index" do
    visit log_ratings_url
    assert_selector "h1", text: "Log Ratings"
  end

  test "creating a Log rating" do
    visit log_ratings_url
    click_on "New Log Rating"

    fill_in "Comment", with: @log_rating.comment
    fill_in "Dish", with: @log_rating.dish_id
    fill_in "Rate", with: @log_rating.rate
    fill_in "Rating", with: @log_rating.rating_id
    fill_in "User", with: @log_rating.user_id
    click_on "Create Log rating"

    assert_text "Log rating was successfully created"
    click_on "Back"
  end

  test "updating a Log rating" do
    visit log_ratings_url
    click_on "Edit", match: :first

    fill_in "Comment", with: @log_rating.comment
    fill_in "Dish", with: @log_rating.dish_id
    fill_in "Rate", with: @log_rating.rate
    fill_in "Rating", with: @log_rating.rating_id
    fill_in "User", with: @log_rating.user_id
    click_on "Update Log rating"

    assert_text "Log rating was successfully updated"
    click_on "Back"
  end

  test "destroying a Log rating" do
    visit log_ratings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Log rating was successfully destroyed"
  end
end
