require 'test_helper'

class StallTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  #----------------- not null
  test "should validate presence of name" do
    stall = Stall.new
    assert !stall.valid?
    assert_equal ["can't be blank"], stall.errors[:name]
  end
  test "should validate presence of owner" do
    stall = Stall.new
    assert !stall.valid?
    assert_equal ["can't be blank"], stall.errors[:owner]
  end
  #----------------- uniqueness
  test "should validate uniqueness of name" do
    old_stall = stalls(:one)
    stall = Stall.new name: old_stall.name
    assert !stall.valid?
    assert_equal ["has already been taken"], stall.errors[:name]
  end
end
