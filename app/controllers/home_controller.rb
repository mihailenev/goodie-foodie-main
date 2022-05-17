class HomeController < ApplicationController
  include SpoonacularHelper
  #Home controller


  def homepage
  end

  def about
  end

  def categories
  end
  
  def favouritespage
    @favourites = Favourite.all
  end

  def leaderboard
  end

  def mealpage
    @recipe = getRecipeById(params[:recipe_id])
  end

  def show
  end

  def paleo
    @page_number = params[:page_number]
  end

  def vegan
    @page_number = params[:page_number]
  end

  def vegetarian
    @page_number = params[:page_number]
  end

  def pescatarian
    @page_number = params[:page_number]
  end

  
  


  
end
