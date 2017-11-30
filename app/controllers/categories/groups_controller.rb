class Categories::GroupsController < ApplicationController

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
  end

  def edit
  end

  def destroy
  end

  private

    def group_params
      params.require(:group).permit(:title, :image, :link, :content)
    end

end