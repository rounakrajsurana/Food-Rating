require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  # before_action :authenticate_user!, :except => [:index, :show]

  setup do
    sign_in users(:Aadmin)
    @category = categories(:one)
  end

  test "should get index" do
    get categories_url
    assert_response :success
  end

  test "should get new" do
    get new_category_url
    assert_response :success
  end

  test "should create category" do
    assert_difference('Category.count') do
      post categories_url, params: { category: { name: '@category.name', user_id: @category.user_id } }
    end

    # assert_redirected_to category_url(Category.last)
    assert_redirected_to categories_url
  end

  test "should not create category" do
    assert_no_difference('Category.count') do
      post categories_url, params: { category: { name: @category.name, user_id: @category.user_id } }
    end
    # assert_response :error
    # assert_redirected_to comment_url(Comment.last)
  end

  test "should show category" do
    get category_url(@category)
    assert_response :success
  end

  test "should get edit" do
    get edit_category_url(@category)
    assert_response :success
  end

  test "should update category" do
    patch category_url(@category), params: { category: { name: @category.name } } #, user_id: @category.user_id
    assert_redirected_to categories_url
  end

  test "should not update category" do
    # assert_no_changes(@category.name)
    patch category_url(@category), params: { category: { name: "" } } #, user_id: @category.user_id
  end

  test "should destroy category" do
    assert_difference('Category.count', -1) do
    delete category_url(@category)
    end

    assert_redirected_to categories_url
  end
end
