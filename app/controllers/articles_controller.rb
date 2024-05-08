class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]

  def index
    @articles = Article.all
  end

  def show; end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      flash[:notice] = 'Article was created successfully 🎉.'
      redirect_to article_path(@article)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @article.update(article_params)
      flash[:notice] = 'Article updated sucessfully 🎉.'
      redirect_to article_path(@article)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @article.destroy
      flash[:notice] = 'Article was deleted successfully 🎉.'
      redirect_to articles_path
    else
      flash[:alert] = 'Something went wrong. Please try again.'
      redirect_to article_path(@article)
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :description)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
