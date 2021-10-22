class OutfitsController < ApplicationController
  before_action :authenticate_proposer!, only: %i[new create edit update destroy]
  before_action :set_outfit, only: [:show, :edit, :update, :destroy]
  

  # GET /outfits
  def index
    @outfits = Outfit.all
    @q = Outfit.ransack(params[:q])
    @outfits = @q.result.includes(:proposer).page(params[:page]).order("created_at desc")
  end

  # GET /outfits/1
  def show
    @stock = current_user.stocks.find_by(outfit_id: @outfit.id)if current_user
    @stocks = @outfit.stocks_users
    #@outfit = current_proposer.outfits.find_by(outfit_id: @outfit.id)
  end

  # GET /outfits/new
  def new
    @outfit = Outfit.new
  end

  # GET /outfits/1/edit
  def edit
  end

  # POST /outfits
  def create
    @outfit = current_proposer.outfits.build(outfit_params)

    if @outfit.save
      redirect_to @outfit, notice: '投稿しました'
    else
      render :new
    end
  end

  # PATCH/PUT /outfits/1
  def update
    if @outfit.update(outfit_params)
      redirect_to @outfit, notice: '投稿を更新しました'
    else
      render :edit
    end
  end

  # DELETE /outfits/1
  def destroy
    @outfit.destroy
    redirect_to outfits_url, notice: '投稿を削除しました'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_outfit
      @outfit = Outfit.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def outfit_params
      params.require(:outfit).permit(:title, :content, :image).merge(proposer_id: current_proposer.id)
    end
end
