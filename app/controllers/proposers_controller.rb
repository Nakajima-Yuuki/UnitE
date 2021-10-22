class ProposersController < ApplicationController
  before_action :authenticate_proposer!
  def index
    
  end

  def show
    @proposer = Proposer.find(params[:id])
    @outfits = Outfit.all
    @myoutfits = current_proposer.outfits
  end
end
