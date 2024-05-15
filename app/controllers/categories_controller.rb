class CategoriesController < ApplicationController
  def index; end

  def new 
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  def show; end

  def edit; end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
