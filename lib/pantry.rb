class Pantry
    attr_reader :stock
    
    def initialize
        @stock = Hash.new(0)
    end
    
    def stock_check(ingredient)
        @stock[ingredient]
    end 

    def restock(ingredient, amount)
        @stock[ingredient] += amount 
    end 

    def enough_ingredients_for?(recipe)
        enough = true 
        recipe.ingredients_required.each_pair do |ingredient, amount|
            if !@stock[ingredient].nil? && @stock[ingredient] >= amount
                next 
            else
                enough = false
            end  
        end
        enough  
    end 
end 