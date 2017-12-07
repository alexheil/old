class Categories::PostsController < ApplicationController

  before_action :authenticate_admin!, except: :show
  before_action :unpublished_group, only: :show

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
    @group = Group.friendly.find(params[:group_id])
    @category = Category.friendly.find(params[:category_id])
    @post = Post.friendly.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:notice] = "Good job!"
      redirect_to category_group_post_path(@category, @group, @post)
    else
      flash.now[:alert] = 'Bad job!'
      render 'edit'
    end
  end

  def edit
    @post = Post.friendly.find(params[:id])
    @group = Group.friendly.find(params[:group_id])
    @category = Category.friendly.find(params[:category_id])
  end

  def destroy
    @post = Post.friendly.find(params[:id]).destroy
    redirect_to root_url
    flash[:notice] = "Delete successful."
  end

  private

    def post_params
      params.require(:post).permit(:title, :number, :image, :image_source, :image_source_link, :anchor, :link, :embed, :content)
    end

    def unpublished_group
      @group = Group.friendly.find(params[:group_id])
      if @group.published == false
        redirect_to root_url unless admin_signed_in?
      end
    end

end