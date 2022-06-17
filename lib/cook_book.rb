class CookBook
    attr_reader :recipes, :date

    def initialize
        @recipes = []
        @date = Time.now.strftime("%m-%d-%Y")
    end 

    def add_recipe(recipe)
       @recipes << recipe 
    end 

    def combine_ingredients
        ingredients = {}
        @recipes.each do |recipe|             
            ingredients.merge!(recipe.ingredients_required)
        end 
        ingredients
    end 

    def ingredients
        ingredients = combine_ingredients.keys.map do |ingredient|
            ingredient.name
        end 
    end 

    def highest_calorie_meal
        @recipes.max do |recipe|
            recipe.total_calories
        end 
    end
    
    def summary
        summary = @recipes.map do |recipe|
            {name: recipe.name,
            details: {
                ingredients: recipe.hashify_ingredients,
                total_calories: recipe.total_calories
            }}
        end 
    end 
end 