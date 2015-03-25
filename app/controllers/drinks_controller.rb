class DrinksController < ApplicationController
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

  def index
    @drinks = Drink.page(params[:page])
  end

  def category
    @drink = Drink.find_by(drink_params)
    @drink.category
  end

  protected
  def drink_params
    params.require(:drink).permit(:title, :description)
  end
end
