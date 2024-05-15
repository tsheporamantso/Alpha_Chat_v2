require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @category = Category.create(name: 'Sport')
  end

  test 'should get index' do
    get categories_path
    assert_response :success
  end

  test 'should get new' do
    get new_category_path
    assert_response :success
  end

  test 'should get show' do
    get category_path(@category)
    assert_response :success
  end

  test 'should get edit' do
    get edit_category_path(@category)
    assert_response :success
  end

  test 'should create category' do
   assert_difference('Category.count', 1) do
     post categories_path, params: { category: { name: 'Travel' } }  
   end
    assert_redirected_to category_path(Category.last)
  end
end
