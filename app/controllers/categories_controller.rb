class CategoriesController < ApplicationController
  def index 
   @categories = Category.paginate(page: params[:page], per_page: 3)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = 'Category was successfully created'
      redirect_to category_path(@category)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit; end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
