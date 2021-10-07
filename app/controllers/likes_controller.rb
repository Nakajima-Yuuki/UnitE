class LikesController < ApplicationController
  #before_action :authenticate_user!
  before_action :outfit_params

  def create
    Like.create(user_id: current_user.id, outfit_id: params[:id])
        
  end
    
  def destroy
    Like.find_by(user_id: current_user.id, outfit_id: params[:id]).destroy
        
  end
    
  private 
      
  def outfit_params
    @outfit = Outfit.find(params[:id])
  end
end
