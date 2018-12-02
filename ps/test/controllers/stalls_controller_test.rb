require 'test_helper'

class StallsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    sign_in users(:Aadmin)
    @stall = stalls(:one)
  end

  test "should get index" do
    get stalls_url
    assert_response :success
  end

  test "should get new" do
    get new_stall_url
    assert_response :success
  end

  # test "should create stall" do
  #   assert_difference('Stall.count') do
  #     post stalls_url, params: { stall: { name: '@stall.name', desc: @stall.desc, picture: @stall.picture, latlog: @stall.latlog, owner: @stall.owner } } #, user_id: @stall.user_id
  #   end
  #   assert_redirected_to stall_url(Stall.last)
  # end

  test "should show stall" do
    get stall_url(@stall)
    assert_response :success
  end

  test "should get edit" do
    get edit_stall_url(@stall)
    assert_response :success
  end

  # test "should update stall" do
  #   patch stall_url(@stall), params: { stall: { desc: @stall.desc, latlog: @stall.latlog, name: @stall.name, picture: @stall.picture, user_id: @stall.user_id, owner: @stall.owner } }
  #   assert_redirected_to stall_url(@stall)
  # end

  test "should destroy stall" do
    assert_difference('Stall.count', -1) do
      delete stall_url(@stall)
    end

    assert_redirected_to stalls_url
  end
end
