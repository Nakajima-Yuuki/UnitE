class ProposersController < ApplicationController

  def index
    
  end

  def show
    @proposer = Proposer.find(params[:id])
    @outfits = Outfit.all
    #@outfit = Outfit.where(proposer_id: @proposer.id)
    @myoutfits = current_proposer.outfits
  end
end
