require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
  end

  test "should be invalid if no name or no email" do
    user = User.new
    assert !user.valid?
    [:name, :email].each do |f|
      assert user.errors.keys.include? f
    end
  end

  test "should be valid if name and email exist" do
    user = User.new(@user_example)
    assert user.valid?
  end

  test "should have unique email" do
    user = User.new(@user_example)
    user.save
    user = User.new(@user_example)
    assert !user.valid?
    assert user.errors[:email].include? "has already been taken"
  end
end
