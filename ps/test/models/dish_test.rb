require 'test_helper'

class DishTest < ActiveSupport::TestCase
  #----------------- not null
  test "should validate presence of name" do
    dish = Dish.new
    assert !dish.valid?
    assert_equal ["can't be blank"], dish.errors[:name]
  end
  test "should validate presence of category" do
    dish = Dish.new
    assert !dish.valid?
    assert_equal ["can't be blank"], dish.errors[:category_id]
  end
  test "should validate presence of stall" do
    dish = Dish.new
    assert !dish.valid?
    assert_equal ["can't be blank"], dish.errors[:stall_id]
  end
end
