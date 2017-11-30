class Categories::CategoriesController < ApplicationController

  before_action :authenticate_admin!, except: [:show, :index]

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
    @category = Category.friendly.find(params[:id])
    if @category.update_attributes(category_params)
      flash[:notice] = "Good job!"
      redirect_to category_path(@category)
    else
      flash.now[:alert] = 'Bad job!'
      render 'edit'
    end
  end

  def edit
    @category = Category.friendly.find(params[:id])
  end

  def destroy
    @category = Category.friendly.find(params[:id]).destroy
    redirect_to root_url
    flash[:notice] = "Delete successful."
  end

  private

    def category_params
      params.require(:category).permit(:title, :image, :link)
    end

end