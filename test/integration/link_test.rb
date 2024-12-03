require 'test_helper'

class LinkTest < ActionDispatch::IntegrationTest
  test 'Links index' do
    get links_path
    assert_response :ok
  end

  test 'Links index pagination' do
    get links_path(page: 2)
    assert_response :ok
  end

  test 'Links show' do
    get links_path(links(:anonymous))
    assert_response :ok
  end

  test 'Create link requires URL' do
    post links_path, params: { link: { url: '' } }
    assert_response :unprocessable_entity
  end

  test 'Create link as guest HTML' do
    assert_difference 'Link.count' do
      post links_path, params: { link: { url: 'https://facebook.com' } }
      assert_response :redirect
      assert_nil Link.last.user_id
    end
  end

  test 'Create link as guest TURBO' do
    assert_difference 'Link.count' do
      post links_path(format: :turbo_stream), params: { link: { url: 'https://facebook.com' } }
      assert_response :ok
      assert_nil Link.last.user_id
    end
  end

  test 'Create link as user' do
    user = users(:one)
    sign_in user

    assert_difference 'Link.count' do
      post links_path(format: :turbo_stream), params: { link: { url: 'https://facebook.com' } }
      assert_response :ok
      assert_equal user.id, Link.last.user_id
    end
  end

  test 'guest cannot edit an anonymous link' do
    get edit_link_path(links(:anonymous))
    assert_response :redirect
  end

  test 'guest cannot edit a user\'s link' do
    get edit_link_path(links(:one))
    assert_response :redirect
  end

  test 'user cannot edit another user\'s link' do
    user = users(:one)
    sign_in user

    get edit_link_path(links(:two))
    assert_response :redirect
  end

  test 'user cannot edit anonymous link' do
    user = users(:one)
    sign_in user

    get edit_link_path(links(:anonymous))
    assert_response :redirect
  end

  test 'user can edit their own link' do
    user = users(:one)
    sign_in user

    get edit_link_path(links(:one))
    assert_response :ok
  end
end
