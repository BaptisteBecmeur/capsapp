class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @prestations = @user.prestations
  end

 end
