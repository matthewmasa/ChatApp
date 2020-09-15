# frozen_string_literal: true

class UsersController < ApplicationController
  def edit

  end

  def update
    @current_user.find_by(params[:id])
    if current_user.update
      redirect_to root_path
    else
      render :edit
    end
  end

  private
   def user_params
     params.require(:user).permit(:name,:email)
   end
end
