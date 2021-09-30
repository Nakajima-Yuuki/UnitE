class ProposersController < ApplicationController
  def show
    @proposer = Proposer.find(params[:id])
  end
end
