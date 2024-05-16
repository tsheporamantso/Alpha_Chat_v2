require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest

  setup do
    @category = Category.new(name: 'Technology')
  end

  test 'it should get index' do
    get categories_path
    assert_response :success 
  end

  test 'it should get new' do
    get new_category_path
    assert_response :success
  end
end