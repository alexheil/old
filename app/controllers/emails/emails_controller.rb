class Emails::EmailsController < ApplicationController

  def create
    @email = Email.new(email_params)
    if @email.save
      redirect_to root_url
    else
      flash.now[:alert] = 'Whoa! Something went wrong!'
      redirect_to root_url
    end
  end

  def unsubscribe
    @email = Email.find(params[:id]).destroy
    redirect_to root_url
  end

  def destroy
    @email = Email.find(params[:id]).destroy
    redirect_to root_url
  end

  private

    def email_params
      params.require(:email).permit(:email)
    end

end