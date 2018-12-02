require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "should validate presence of name" do
    category = Category.new
    assert !category.valid?
    assert_equal ["can't be blank"], category.errors[:name]
  end

  test "should validate uniqueness of name" do
    old_category = categories(:one)
    category = Category.new name: old_category.name
    assert !category.valid?
    assert_equal ["has already been taken"], category.errors[:name]
  end

end
