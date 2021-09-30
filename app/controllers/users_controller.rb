class UsersController < ApplicationController

  def index

  end

  def show
    @user = User.find(params[:id]) #追記
  end
end
