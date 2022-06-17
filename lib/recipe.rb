class Recipe
    attr_reader :name, :ingredients, :ingredients_required

    def initialize(name)
        @name = name
        @ingredients = []
        @ingredients_required = Hash.new(0)
    end 

    def add_ingredient(ingredient, amount)
        @ingredients << ingredient
        @ingredients_required[ingredient] += amount
    end 

    def total_calories
        calories = 0
        @ingredients_required.each_pair do |ingredient, amount|
            
            calories += (ingredient.calories * amount)
        end
        calories
    end 
    
    def sort_ingredients
        sorted = ingredients_required.sort_by do |ingredient_amount|
             - (ingredient_amount[0].calories * ingredient_amount[1])
        end 
        sorted
    end 
    
    def hashify_ingredients
        hashified = sort_ingredients.map do |ingredient_amount|
            {ingredient: ingredient_amount[0].name,
            amount: "#{ingredient_amount[1]} #{ingredient_amount[0].unit}"}
        end 
    end 
end 