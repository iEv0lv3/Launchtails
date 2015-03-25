class FeaturedDrinksController < ApplicationController
  def index
    @drinks = Drinks.featured.page
  end
end
