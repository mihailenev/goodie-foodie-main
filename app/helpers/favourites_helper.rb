module FavouritesHelper
    def favourite_exists(user, recipe_id)
        result = false
        Favourite.all.each do |f|
          if f.user.email === user.email && f.recipe === recipe_id
            result = true
          end
        end

        return result
    end

end
