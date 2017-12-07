class StaticPagesController < ApplicationController

  def home
    @categories = Category.all
    @recent_groups = Group.where(:published => true).reorder("created_at desc").limit(10).offset(1)
    @first_group = Group.where(:published => true).reorder("created_at desc").first
    @email = Email.new
  end

  def about
  end

  def privacy
  end

  def terms
  end

end