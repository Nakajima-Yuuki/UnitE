class ProposersController < ApplicationController

  def index
    
  end

  def show
    @proposer = Proposer.find(params[:id])
    @outfits = Outfit.all

  end
end
