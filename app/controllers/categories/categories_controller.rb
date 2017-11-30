class Categories::CategoriesController < ApplicationController

  def index
  end

  def show
    @categories = Category.all
    @category = Category.friendly.find(params[:id])
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "You just created " + @category.title + "!"
      redirect_to category_path(@category)
    else
      flash.now[:alert] = 'Whoa! Something went wrong!'
      render 'new'
    end
  end

  def new
    @category = Category.new
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private

    def category_params
      params.require(:category).permit(:title, :image, :link)
    end

end