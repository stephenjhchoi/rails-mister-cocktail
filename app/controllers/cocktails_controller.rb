class CocktailsController < ApplicationController

  before_action :set_cocktails, only: [:edit, :update, :show, :destroy]

  def index
    @cocktails = Cocktail.all
  end

  def show
    @dose = Dose.new # For the new dose form
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktails_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit

  end

  def update
    @cocktail.update(cocktails_params)
    redirect_to cocktail_path
  end

  def destroy
    @cocktail.destroy
    redirect_to root_path
  end

  private

  def set_cocktails
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktails_params
    params.require(:cocktail).permit(:name)
  end


end
