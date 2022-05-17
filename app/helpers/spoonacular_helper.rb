module SpoonacularHelper

    $keyRobyn = '8659dec78b4b4e54afad44374925279f'
    $keyMike = '1685c6409e5a4d2cacaee9fcc33bd5cd'
    $keyDylan = '633a4e9b7ffd438f9ce884cbe4b68a8d'

    def makeRequestNew(url)
        require 'uri'
        require 'net/http'
        require 'openssl'

        url = URI(url)

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Get.new(url)

        response = http.request(request)
        puts ":::::::::::INFO HERE:::::::::::"
        puts response.read_body
        puts ":::::::::::::::::::::::::::::::"

        data = response.read_body
        parsedData = JSON.parse(data)
        return parsedData
    end


    # template for making a request so we don't have to keep writing the same code
    # converts data from JSON to ruby hash and returns that
    def makeRequest(url, key)
        require 'uri'
        require 'net/http'
        require 'openssl'

        url = URI(url)

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Get.new(url)
        request["x-api-host"] = 'https://api.spoonacular.com/'
        request["x-api-key"] = key

        response = http.request(request)
        puts ":::::::::::INFO HERE:::::::::::"
        puts response.read_body
        puts ":::::::::::::::::::::::::::::::"

        data = response.read_body
        parsedData = JSON.parse(data)
        return parsedData
    end

    # test method
    def getMealPlan()
        url = "https://api.spoonacular.com/mealplanner/generate"
        key = $keyRobyn
        data = makeRequest(url, key)
        return data['week']['monday']['meals']
    end

    # Giving numberOfResults, pageNumber and diet as parameters
    # numberOfResults(Integer) - how meny recipes to return
    # pageNumber(Integer) - using it to compute offset
    # diet(String) - type of diet
    #returning 'numberOfResults' of recipes from 'offset' for 'diet'
    def getRecipesByDiet(numberOfResults, pageNumber, diet)
        offset = numberOfResults * pageNumber
        url = "https://api.spoonacular.com/recipes/complexSearch?limitLicense=true&number=#{numberOfResults}&offset=#{offset}&diet=#{diet}"
        key = $keyMike
        data = makeRequest(url, key)
        return data
    end

    # Giving a recipe id as parameter, returning more information for it
    def getRecipeById(id)
        url = "https://api.spoonacular.com/recipes/#{id}/information?apiKey=#{$keyRobyn}&includeNutrition=true"
        key = $keyRobyn
        data = makeRequestNew(url)
        return data
    end

    # Giving a recipes ids as parameter(strring separated by comma), returning more information for them
    def getRecipesByIds(ids)
        url = "https://api.spoonacular.com/recipes/informationBulk?apiKey=#{$keyMike}&ids=#{ids}&includeNutrition=true"
        key = $keyMike
        data = makeRequestNew(url)
        return data
    end

    # Giving a recipe id and number as parameters,
    # returning information for similar 'number' recipes similar to 'id'
    def getSimilarRecipesById(id,number)
        url = "https://api.spoonacular.com/recipes/#{id}/similar?apiKey=#{$keyMike}&limitLicense=true&number=#{number}"
        key = $keyMike
        data = makeRequestNew(url)
        return data
    end

end
