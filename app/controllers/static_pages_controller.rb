class StaticPagesController < ApplicationController

  def home
    @categories = Category.all
    @recent_groups = Group.reorder("created_at desc").limit(10)
  end

end