require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should not create user without name" do
  	user = User.new
    assert !user.save
  end

  test "assert" do
  	assert true
  end
end
