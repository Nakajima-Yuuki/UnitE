class UsersController < ApplicationController

  def index

  end

  def show
    @user = User.find(params[:id])
    @stocks = Stock.all
  end

end
