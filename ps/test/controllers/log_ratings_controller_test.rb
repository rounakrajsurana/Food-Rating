require 'test_helper'

class LogRatingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @log_rating = log_ratings(:one)
    @rating = ratings(:one)
  end

  # test "should get index" do
  #   get log_ratings_url
  #   assert_response :success
  # end

  # test "should get new" do
  #   get new_log_rating_rating_url(@rating)
  #   assert_response :success
  # end

  # test "should create log_rating" do
  #   assert_difference('LogRating.count') do
  #     post log_ratings_url, params: { log_rating: { comment: @log_rating.comment, dish_id: @log_rating.dish_id, rate: @log_rating.rate, rating_id: @log_rating.rating_id, user_id: @log_rating.user_id } }
  #   end
  #
  #   assert_redirected_to log_rating_url(LogRating.last)
  # end
  #
  # test "should show log_rating" do
  #   get rating_url(@rating)
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get edit_log_rating_url(@log_rating)
  #   assert_response :success
  # end
  #
  # test "should update log_rating" do
  #   patch log_rating_url(@log_rating), params: { log_rating: { comment: @log_rating.comment, dish_id: @log_rating.dish_id, rate: @log_rating.rate, rating_id: @log_rating.rating_id, user_id: @log_rating.user_id } }
  #   assert_redirected_to log_rating_url(@log_rating)
  # end
#
#   test "should destroy log_rating" do
#     assert_difference('LogRating.count', -1) do
#       delete log_rating_url(@log_rating)
#     end
#
#     assert_redirected_to log_ratings_url
#   end
end
