require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest

  setup do
    @category = Category.create(name: 'Technology')
  end

  test 'it should get index' do
    get categories_path
    assert_response :success 
  end

  test 'it should get new' do
    get new_category_path
    assert_response :success
  end

  test 'it should get show' do
    get category_path(@category)
    assert_response :success
  end

  test 'it should get edit' do
    get edit_category_path(@category)
    assert_response :success
  end
end