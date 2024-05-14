require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  test 'category should be valid' do
    @category = Category.new(name: 'Sport')
    assert @category.valid?
  end

  test 'it should not be valid without the name' do
    @category = Category.new(name: '')
    assert_not @category.valid?
  end

  test 'name should be unique' do
    @category = Category.new(name: 'Sport')
    @category.save
    @category2 = Category.new(name: 'Sport')
    assert_not @category2.valid?
  end

  test 'length should not be too long' do
    @category = Category.new(name: 'a' * 40)
    assert_not @category.valid?
  end
end