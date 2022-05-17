Rails.application.routes.draw do
  resources :favourites
  # Added resources : favourites back to show the users what favourites they have favourited
  # resources route shows (and allows edits of) the entire favourites table
  # i think we should make a seperate favourites page and leave this for debugging purposes
  # i.e. delete it later

  devise_for :users
  root 'home#homepage'
  get 'about', to: 'home#about'
  get 'categories', to: 'home#categories'
  get 'leaderboard', to: 'home#leaderboard'
  get 'favouritespage', to: 'home#favouritespage'
  get 'mealpage/:recipe_id', to: 'home#mealpage', as: 'mealpage'

  # categories
  get 'paleo/:page_number', to: 'home#paleo', as: 'paleo'
  get 'vegan/:page_number', to: 'home#vegan', as: 'vegan'
  get 'vegetarian/:page_number', to: 'home#vegetarian', as: 'vegetarian'
  get 'pescatarian/:page_number', to: 'home#pescatarian', as: 'pescatarian'

  # route for adding a favourite for the current user
  put 'mealpage/:recipe_id/favourite', to: 'favourites#addfavourite', as: 'addfavourite'
  # and for removing
  put 'mealpage/:recipe_id/favouriteremove', to: 'favourites#removefavourite', as: 'removefavourite'
 
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
