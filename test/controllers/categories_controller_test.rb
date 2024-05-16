require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest

  setup do
    @category = Category.new(name: 'Technology')
  end

  test 'it should get index' do
    get categories_path
    assert_response :success 
  end
end