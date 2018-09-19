require 'test_helper'

class SolutionControllerTest < ActionDispatch::IntegrationTest
  test "should get ps1_dividezero" do
    get solution_ps1_dividezero_url
    assert_response :success
  end

end
