class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @categories = Category.find(params[:category_id])
    @drinks = Drink.where("category_id = #{params[:category_id]}")
  end

end
