require 'test_helper'

class UsersTest < ActionDispatch::IntegrationTest
  test 'guest user' do
    get links_path
    assert_select 'a', 'Log In'
    assert_select 'a', 'Sign Up'
  end

  test 'user can be logged in' do
    sign_in users(:one)
    get links_path
    assert_select 'a', 'Profile'
    assert_select 'button', 'Log Out'
  end
end
