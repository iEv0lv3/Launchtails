class DrinksController < ApplicationController

  def index
    @drinks = Drink.page(params[:page])
  end

  def new
    @drink = Drink.new
  end

  def create
    @drink = Drink.new(drink_params)
    if @drink.save
      flash[:notice] = 'Drink added.'
      redirect_to drinks_path
    else
      render :new
    end
  end

  def destroy
    Drink.destroy(params[:id])
    flash[:notice] = "Drink deleted."
    redirect_to drinks_path
  end

  protected
  def drink_params
    params.require(:drink).permit(:title, :description, :category_id)
  end
end
