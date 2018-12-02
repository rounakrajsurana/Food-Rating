require 'test_helper'

class DishesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:Astall)
    @dish = dishes(:one)
  end

  test "should get index" do
    get dishes_path
    assert_response :success
  end

  test "should get new" do
    get new_dish_path
    assert_response :success
  end

  test "should create dish" do
    assert_difference('Dish.count') do
      post dishes_path, params: { dish: { category_id: @dish.category_id, desc: @dish.desc, name: @dish.name, picture: @dish.picture, stall_id: @dish.stall_id, user_id: @dish.user_id } }
    end

    assert_redirected_to dish_url(Dish.last)
  end

  test "should show dish" do
    get dish_path(@dish)
    assert_response :success
  end

  test "should get edit" do
    get edit_dish_path(@dish)
    assert_response :success
  end

  test "should update dish" do
    patch dish_path(@dish), params: { dish: { category_id: @dish.category_id, desc: @dish.desc, name: @dish.name, picture: @dish.picture, stall_id: @dish.stall_id, user_id: @dish.user_id } }
    assert_redirected_to dish_url(@dish)
  end

  test "should destroy dish" do
    assert_difference('Dish.count', -1) do
      delete dish_path(@dish)
    end

    assert_redirected_to dishes_url
  end
end
