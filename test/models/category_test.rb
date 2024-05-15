require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = Category.new(name: 'Sport')
  end

  test 'category should be valid' do
    assert @category.valid?
  end

  test 'it should not be valid without the name' do
    @category.name = ' '
    assert_not @category.valid?
  end

  test 'name should be unique' do
    @category.save
    @category2 = Category.new(name: 'Sport')
    assert_not @category2.valid?
  end

  test 'length should not be too long' do
    @category.name = 'a' * 31
    assert_not @category.valid?
  end

  test 'name should not be too short' do
    @category.name = 'a'
    assert_not @category.valid?
  end
end