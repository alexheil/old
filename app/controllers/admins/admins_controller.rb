class Admins::AdminsController < ApplicationController

  before_action :authenticate_admin!

  def show
    @admin = Admin.find(params[:id])
    @groups = Group.all
  end

end