class OffersController < ApplicationController
  def index
    @offers = Offer.all
  end

  def show
    @offer = Offer.find(params[:id])
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user
    if @offer.save
      redirect_to offers_path, notice: 'Offer was successfully created.'
    else
      render :new
    end
  end

  private

  def offer_params
    params.require(:offer).permit(:plastic_bottles, :glass_bottles, :crates, :timeslot, :comment)
  end
end
