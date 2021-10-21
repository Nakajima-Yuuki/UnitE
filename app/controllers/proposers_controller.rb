class ProposersController < ApplicationController

  def index
    
  end

  def show
    @proposer = Proposer.find(params[:id])
    @outfits = Outfit.all
    @myoutfits = current_proposer.outfits
  end
end
