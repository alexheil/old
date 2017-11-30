class Categories::PostsController < ApplicationController

  def index
  end

  def show
    @post = Post.friendly.find(params[:id])
    @group = Group.friendly.find(params[:group_id])
    @category = Category.friendly.find(params[:category_id])
  end

  def create
    @category = Category.friendly.find(params[:category_id])
    @group = Group.friendly.find(params[:group_id])
    @post = @group.posts.build(post_params)
    if @post.save
      flash[:notice] = "You just created " + @post.title + "!"
      redirect_to category_group_path(@category, @group)
    else
      flash.now[:alert] = 'Whoa! Something went wrong!'
      render 'new'
    end
  end

  def new
    @post =  Post.new
    @group = Group.friendly.find(params[:group_id])
    @category = Category.friendly.find(params[:category_id])
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private

    def post_params
      params.require(:post).permit(:title, :number, :image, :link, :embed, :content)
    end

end