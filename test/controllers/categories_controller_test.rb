require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = Category.create(name: 'Technology')
    @admin_user = User.create(username: 'johndoe', email: 'johndoe@example.com', password: 'password', admin: true)
  end

  test 'it should get index' do
    get categories_path
    assert_response :success
  end

  test 'it should get new' do
    sign_in_as(@admin_user)
    get new_category_path
    assert_response :success
  end

  test 'it should get show' do
    get category_path(@category)
    assert_response :success
  end

  # test 'it should get edit' do
  #   get edit_category_path(@category)
  #   assert_response :success
  # end

  test 'should create category' do
    sign_in_as(@admin_user)
    assert_difference('Category.count', 1) do
      post categories_path, params: { category: { name: 'Travel' } }
    end
    assert_redirected_to category_path(Category.last)
  end

  test 'should not create category if not admin' do
    assert_no_difference('Category.count') do
      post categories_path, params: { category: { name: 'Travel' } }
    end
    assert_redirected_to categories_path
  end
end
