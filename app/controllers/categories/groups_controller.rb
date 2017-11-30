class Categories::GroupsController < ApplicationController

  before_action :authenticate_admin!, except: [:show, :index]

  def index
  end

  def show
    @group = Group.friendly.find(params[:id])
    @category = Category.friendly.find(params[:category_id])
  end

  def create
    @category = Category.friendly.find(params[:category_id])
    @group = @category.groups.build(group_params)
    @group.admin_id = current_admin.id
    if @group.save
      flash[:notice] = "You just created " + @group.title + "!"
      redirect_to category_group_path(@category, @group)
    else
      flash.now[:alert] = 'Whoa! Something went wrong!'
      render 'new'
    end
  end

  def new
    @group = Group.new
    @category = Category.friendly.find(params[:category_id])
  end

  def update
    @category = Category.friendly.find(params[:category_id])
    @group = Group.friendly.find(params[:id])
    if @group.update_attributes(group_params)
      flash[:notice] = "Good job!"
      redirect_to category_group_path(@category, @group)
    else
      flash.now[:alert] = 'Bad job!'
      render 'edit'
    end
  end

  def edit
    @group = Group.friendly.find(params[:id])
    @category = Category.friendly.find(params[:category_id])
  end

  def destroy
    @group = Group.friendly.find(params[:id]).destroy
    redirect_to root_url
    flash[:notice] = "Delete successful."
  end

  private

    def group_params
      params.require(:group).permit(:title, :image, :image_source, :image_source_link, :link, :content)
    end

end