require 'test_helper'

class RatingsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    sign_in users(:Amember)
    @rating = ratings(:one)
    @dish = dishes(:one)
  end

  test "should get index" do
    get '/home/review'
    assert_response :success
  end

  test "should get new" do
    get new_dish_rating_path(@dish)
    assert_response :success
  end

  # test "should create rating" do
  #   assert_difference('Rating.count') do
  #   post new_dish_rating_url(@dish), params: { rating: { comment: @rating.comment, dish_id: 3, rate: @rating.rate, user_id: @rating.user_id } }
  # end
  #   assert_redirected_to dish_path(@dish)
  # end

  # test "should show rating" do
  #   get rating_url(@rating)
  #   assert_response :success
  # end

  test "should get edit" do
    get edit_dish_rating_path(@rating.dish_id, @rating)
    assert_response :success
  end

  test "should update rating" do
    get edit_dish_rating_url(@rating.dish_id, @rating), params: { rating: { comment: @rating.comment, dish_id: @rating.dish_id, rate: @rating.rate, user_id: @rating.user_id } }
    assert_response :success
  end

  test "should destroy rating" do
    assert_difference('Rating.count', -1) do
      delete rating_url(@rating)
    end
    assert_redirected_to dish_path(@dish)
  end
end
