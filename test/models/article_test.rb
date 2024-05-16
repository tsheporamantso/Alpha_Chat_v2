require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  setup do
    @article = Article.new(title: 'John Doe', description: 'John is the best and famous web developer in the world')
  end

  test 'article should be valid' do
    @article.save
  end

  test 'it should not be valid without the title' do
    @article.title = ''
  end

  test 'it should not be valid without the description' do
    @article.description = ''
  end

  test 'title should not be too long' do
    @article.title = 'a' * 101
  end

  test 'title should not be too short' do
    @article.title = '2' * 5
  end

  test 'description should not be too long' do
    @article.description = 'w' * 501
  end

  test 'description should not be too short' do
    @article.description = 'w' * 9
  end
end
